---
title: How to BOSH
date: 2016/11/01 00:00:01
layout: post
---

[BOSH](http://bosh.io) is a set of tools -- a **CLI**, a **server ("Director")** and an **agent** -- that together let you deploy collections of virtual machines to the cloud. You can deploy on a bunch of different cloud providers: Amazon Web Services, Google Compute Platform, Microsoft Azure and more.

It's notable because it's the _de facto_ deployment tool for [Cloud Foundry](http://docs.cloudfoundry.org/concepts/overview.html), the open-source platform-as-a-service.

Give BOSH a **manifest** (a YAML file detailing what machines you want deployed, how they should be networked, and what code they should run) and BOSH will make it so.

If something happens to one of your VMs, BOSH will recreate it automatically. Change the manifest and re-deploy, and BOSH will change only what's needed to get to the desired state. Point to a different cloud, and BOSH will deploy that same set of machines identically. BOSH is a _converger_ -- that is, it will work to converge your VMs to the correct configuration.

## Director

Let's start with the [Director](https://bosh.io/docs/bosh-components.html#director) -- the beating heart of BOSH. This is just a regular VM deployed to your cloud of choice. It talks to that cloud, and is able to create and destroy VMs, persistent disks, assign IPs and basically do everything you'd otherwise have to do manually.

But... how do you deploy a Director? The fastest way is to use [bosh-bootloader](https://github.com/cloudfoundry/bosh-bootloader).[^bosh-deploy-bosh] Once that's done, we have a Director, ready to deploy VMs:

[^bosh-deploy-bosh]: If you already have a BOSH Director, you can use it to deploy another Director, as the Director is itself a BOSH release. And if you have two directors, you can trick them into thinking each one deployed the other, so if one goes down, the other one will resurrect it.

```ruby
+---------------+
| BOSH Director |
+---------------+
```

## Atoms

The smallest unit of a BOSH deployment is the **job**. This might be something like [Redis](http://redis.io), a key-value datastore. This job is packaged up, possibly with other jobs, into a **release**. Once you have some releases, you can compose the jobs within into a deployment in any way you choose. This is part of the power of BOSH.

Here's our `redis-server` job:

```ruby
+----------------------------+
| redis-server               | <--- job
|                            |
+----PRESTART---CTL---DRAIN--+
```

`pre-start`, `ctl` and `drain` are scripts that the job has that BOSH uses to prepare it for starting, start it up, and shut it down respectively.

Okay, we want BOSH to get Redis running for us. A job isn't enough for that -- it's just a collection of scripts that BOSH knows how to run. To get it going, that job needs to be put on an **instance** -- an actual VM that BOSH will spin up for us.

## Deployments

We can put together a simple manifest for this kind of **deployment**:

```yaml
---
name: my-cool-redis

releases:
- name: redis-release
  version: 1

instance_groups:
- name: redis
  instances: 1
  jobs:
  - name: redis-server
    release: redis-release
  networks:
  - name: default
```

And, once we run `bosh deploy` on our local machine, BOSH will tell the Director to deploy our lone Redis machine.

```ruby       
+--------------------------------+
|            redis/0             | <--- instance
| +----------------------------+ |
| | redis-server               | |
| |                            | |
| +----PRESTART---CTL---DRAIN--+ |
|                                |
| +----------------------------+ |
| | BOSH Agent                 | |
| +----------------------------+ |
+===========+====================+
            |
+-----------+---+
| BOSH Director |
+---------------+
```

Nice! We now have one VM running on our platform of choice, and that VM is running Redis. If Redis misbehaves, the Agent, also running on the VM, will restart it (using [monit](https://mmonit.com/monit/) under the hood for process management). And if the VM dies or disconnects from the Director, then the Director will redeploy it.

If we want to scale out our deployment a bit, we can just make a small change to our manifest...

```yaml
instance_groups:
- name: redis
  instances: 2     <<
```

and redeploy:

```ruby
+--------------------------------+
|                       redis/0  |
| +----------------------------+ |
| | redis-server               | |
| |                            | |
| +----PRESTART---CTL---DRAIN--+ |
|                                |
| +----------------------------+ |
| | BOSH Agent                 | |
| +----------------------------+ |
+===========+====================+
            |
+-----------+---+
| BOSH Director |
+-----------+---+
            |
+-----------+--------------------+
|                       redis/1  |
| +----------------------------+ |
| | redis-server               | |
| |                            | |
| +----PRESTART---CTL---DRAIN--+ |
|                                |
| +----------------------------+ |
| | BOSH Agent                 | |
| +----------------------------+ |
+================================+
```

Sweet. Notice that each instance has a _name_ (`redis`) and an _index_ (`0`) which allows it to be uniquely identified in a deployment. And say we have a `redis-metrics` job that collects some usage data about our Redis -- we can _co-locate_ that job onto our instances with a single change:

```yaml
instance_groups:
- name: redis
  instances: 1
  jobs:
  - name: redis-server
    release: redis-release
  - name: redis-metrics      <<
    release: redis-release   <<
```

```ruby
+--------------------------------+
|                       redis/0  |
| +----------------------------+ |
| | redis-server               | |
| |                            | |
| +----PRESTART---CTL---DRAIN--+ |
| +----------------------------+ |
| | redis-metrics              | |
| |                            | |
| +----PRESTART---CTL---DRAIN--+ |
|                                |
| +----------------------------+ |
| | BOSH Agent                 | |
| +----------------------------+ |
+===========+====================+
            |
+-----------+---+
| BOSH Director |
+-----------+---+
            |
+-----------+--------------------+
|                       redis/1  |
| +----------------------------+ |
| | redis-server               | |
| |                            | |
| +----PRESTART---CTL---DRAIN--+ |
| +----------------------------+ |
| | redis-metrics              | |
| |                            | |
| +----PRESTART---CTL---DRAIN--+ |
|                                |
| +----------------------------+ |
| | BOSH Agent                 | |
| +----------------------------+ |
+================================+
```


***
