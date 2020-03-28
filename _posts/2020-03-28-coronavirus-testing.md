---
title: "Coronavirus testing"
date: 2020-03-28T11:00:00
layout: post
---


**NB -- I have a handful of antibody tests going spare (bought some for friends and family) - [message me](mailto:henry@henrystanley.com) if you want one.**

---

There's been lots of talk in the media about testing people for SARS-CoV-2 (or "coronavirus") infection.

Knowing who's infected is useful: if you're a health worker and you test positive, you know you have to stay at home. But if you test negative, you don't have to lose two weeks of work to self-isolation.

Likewise, if you're a member of the public, you can be triaged for medical help more quickly if you test positive.

There are a bunch of ways you can be tested for coronavirus which are quite different - let's review.

## PCR

Also known as **molecular testing**, this technique takes a swab - from the throat or nose usually - and processes it to detect part of the virus' genome.

Specifically, it uses **RT qPCR** - reverse transcriptase quantitative PCR - to transcribe the virus' genome (which is encoded in RNA) into DNA, and then copy that DNA repeatedly to a quantity that can be detected. The copying process uses a 'primer', a short piece of DNA which matches part of the viral genome. If the virus is present in the sample, its RNA will be amplified to a detectable level. If there's no virus, the primer won't bind to anything and there'll be no amplified DNA to detect.

`viral RNA -> DNA -> binds to primer -> amplified to detectable signal`

### Test shortages

This test requires some specialist equipment - mostly the reagents that are used for the test. Preparing RNA is a pain[^rna], and PCR needs specific enzymes to work (reverse transcriptase and DNA polymerase). It also uses specialist equipment: a 'thermocycler' to raise the temperature of the sample (which causes the DNA strands to separate) and then cool it so the DNA anneals to the primer and the enzymes can do their job (they work much less well at high temperatures).

DIY thermocyclers aren't too difficult to make. You can always just substitute a modern thermocycler for a few water baths at the right temperature, although obviously this will be very laborious as you have to move the samples from one bath to another. But reagent shortages are what's driving the lack of testing at the moment.

### False results

False negatives can quite easily come from the sample being taken incorrectly. This seems especially likely if people are taking the test at home - nasal and throat swabs are uncomfortable, so it's possible people aren't getting a reliable sample. Similarly, some reports state that [throat swabs report false negatives more often than nasal swabs](https://www.cebm.net/2020/03/is-there-any-significant-difference-in-sensitivity-of-covid-19-virus-sars-cov-2-tests-based-on-swabs-from-oropharyngeal-op-vs-nasopharyngeal-np-sampling-vs-both/).

False positives are less likely - if there's no viral RNA present, it's not clear how you could get a signal unless the sample was contaminated.

## Antibody serology

Another class of tests detect whether your blood contains anti-coronavirus antibodies.

These are much like pregnancy tests, which detect hCG (a hormone released during pregnancy). You apply a sample to a piece of paper, and the sample is pulled along by capillary action. It then comes into contact with a reagent that's bound to the paper, like coronavirus spike protein (the 'antigen', or the molecule that causes an immune response). If the sample contains antibodies which bind that protein, the protein will be dragged along the paper. The protein also has a label attached to it - usually something which causes a colour change in specific conditions.

If there's no anti-coronavirus antibody in the sample, it won't bind to the labelled antigen, and no colour change occurs.


```
antibody in blood ->
  binds to labelled antigen forming a complex ->
    antigen passes over detection area ->
      anti-human antibody binds to complex -> colour change
```

Coronavirus antibody test kits have two detection areas - one for IgG antibodies and another for IgM antibodies.

IgM antibodies provide your body's initial immune response. If anti-coronavirus IgM is present in the sample, the patient is likely currently infected.

IgG antibodies are raised later in the infection, and provide long-term immunity. If these are present in the sample, the patient has likely been exposed to coronavirus and fought off the infection.

These tests are quick, giving a result in ten minutes from a drop of blood (obtained by fingerprick), and can be done at home without special equipment. They have some drawbacks: they won't show if someone is infected and asymptomatic/presymptomatic (as they likely haven't raised antibodies against the virus yet), so a negative IgM result could be a false negative.

It's also possible to get a false positive as most of the test kits haven't been tested for cross-reactivity with other coronaviruses (like the common cold). This is a big unknown; I assume the testing the UK government is currently doing will include these sorts of assays.

### Immunity

The appeal of antibody testing is that it tells you if people have had the virus and are now immune - so can go back to work without fear of infection or of reinfecting others. The heroic among them might also [donate their plasma](https://www.bmj.com/content/368/bmj.m1256) to treat coronavirus patients.

It's reasonable to assume that people _can_ develop immunity to coronavirus. There have been some reports of people being 're-infected', but it seems likely that these were either false positives, or that the patient never cleared the virus the first time round (i.e. they tested positive, then false negative, then positive).

What isn't clear is how long immunity will last. [SARS patients kept producing anti-SARS antibodies for 2 years](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC2851497/), with reduction in antibody levels in the third year. However, if coronavirus mutates significantly, it's possible that the new mutant will be infectious even to those with previous immunity.

---

[^rna]: Anyone who's worked in a molecular biology lab will sympathise. Human skin secretes RNAses, or enzymes which break down RNA, as a protection against invading bacteria. Of course, this means if you touch your work surface without gloves and don't clean it properly, your samples are going to end up mysteriously ruined...
