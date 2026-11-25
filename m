Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795565183;
	b=IE5gHyGUl0LDH76Ws3acpZViTlgihLTHjXK293FIrsoU9ImDlas4M/ZsDq9jCWeDgWDf
	 BTj0SDWBdsA0+BlqpXDZCypGuUwzJdx7Kl87YQt15UheglI5z0Vaur5Iov1mJ5X/HNjMc
	 KPykZbXHJ6fy5XlFwVbOAeTCmSnVuJuARITOKXzY6buCiyrCGrh/9tNQktvQmZB/3gOw2
	 5Vn85Ct0Du6YKOOHeWuYKKcBjPU2cd/NZRKpW26MFZkhXtjNT1VaDlgdX/Fetxqd8DC2s
	 4NtvuJhcgB4+c2d9qJPVOFEZ7mOP330alVozQrWaTuM+wTKX85GXRDfBdtiaqoaXUiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795565183;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=9xXqglDy8469GWjwyD/Y8sAmjDXXr4pfODnkEj3WbFo=;
	b=wWpwbFXXDMH0dXb68T+QW+7SH852G5ftrFx1uya7Vqg4lp9u9JadEhYqHcSS0VstZfBV
	 58G1N9sK/NxGrVk6GBxVqlpeU7EROzcCQczbwj8Sg803nALC0uKUy08l8bfRal6zyD8uE
	 x+E7mmBx2SCssIDhMbAob+cXyaIsQuWsp9ACkUWXW8eU/BShkOkFs4TM8drWNKcph35E/
	 L+eb1PD+KrM9VwZo8FWQfdJ/l2rPZoLWAL4b08ddUbYid541J2EA8s4gVE8fQmqoddKK+
	 K94gSuhfIYC4oCgaNXCw3kiS0YOuklFsO8M4kNHIW2vbHMVov9lpzJvXVxdxbfNc0bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=btMlsxxY;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9666D606A327
	for <google-soc@lists.linux.dev>; Wed, 25 Nov 2026 00:06:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9666D606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=btMlsxxY
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-386c336eab8so1449743eec.0
        for <google-soc@lists.linux.dev>; Tue, 24 Nov 2026 16:06:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795565182; x=1796169982; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9xXqglDy8469GWjwyD/Y8sAmjDXXr4pfODnkEj3WbFo=;
        b=btMlsxxYKSvaKqbxTsjDSBAB6nCJHdCcOIYVwXb5iSBkApFEHCYZIUW61YGgSkO7ap
         4nFEy9mpa+gw4n0nqTvdhDhr6UADL9AUkSlfIK1rC08GLDBBOVsS4FRStkgZokelsIad
         Xf0c9smx4BbC+SwFde4+NcUidvbR7g4mqNm14=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795565182; x=1796169982;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9xXqglDy8469GWjwyD/Y8sAmjDXXr4pfODnkEj3WbFo=;
        b=fsSPCLFauJXUv7R/ptC52ez7n+WxDh9pcnF4rkRMj2LVV3bQDW3PwrkTG7x5J9vu2W
         CPi6EmkIrGNhwKFgqJIgJYKeaWGQl7E14WDKwn85a1wjRs0ywyepKKyj+dvCgTMsl6/Q
         7TGN3qqO0yjC/Nvs6VbsnKvmviOmLCjSijnV1uMi4q+ogKVHY/S6czveAxNxuK23fT6S
         iiLUgIGkbhhancKWhyetQWiPmIs3ocVf+LruFWoloJyJgiAPSNo9yWJQ/AFPidCevDga
         Lt6g9A240nYWSK0r+fpoOwvjz33szYOSWBEUoq/LugfKPQcXrd9/fzJ7J6krHBjxrwEp
         YRFw==
X-Forwarded-Encrypted: i=1; AL+hErHgfKqVj+/7WUY6p+hdYtpSeugS8vVAgVl/T4vzzfluEBLx98cYUiSk+mlw8bh1IgyyiI2QuSebsBOc@lists.linux.dev
X-Gm-Message-State: APuU4Z+TNu0GGzdyHcCSnr9s9iPsvWC94AC0olmOj5aMzJfSvHS4U6rx
	OlzxITUhN1mX1qbez7fb33eVSvqUD2qk2m5El3+fnIQvFD1b1zEGZE+RlYoA6Fma1w==
X-Gm-Gg: AZFdTZcS1FmsATQEJLOfHKLXDB75TOZ9x2w2IQycIGw3gq293WrhEgcoXLkSNMOGIHS
	VSwzpXU7cTcFWfqArzRRrZJfjxyL35tCDO9EcZSSlk5ToL3txyVjQTxqqHoEPRXDQomN4DCYIyQ
	uzMg17tqHNsSc0yZWem7Vh0AY0HLSYlvm3BYTHJJ2BKZH7OP8BXssE9JVsXvVEyTbfCDfqxEoF1
	UYq8WXtnGVcEqVLPP+73NbXNO2PMFBagbToUjnPreFVwNX16yZLvbqZ+kEjN0/mlTRTLLl76jel
	2gvOXlJQMB4CkZKpXNGvyXfA/LLIUtEerLXiMlsYk7SMt0ksLPbWzW2YcwUhlQ44b14Cg6aKrYf
	eI5tkJ0k75ufD/S8menVK/+NET+9XPdXhNY9sLNDT+ClihMFp5QhtLl2g7SZHDD4/z6SYWqBiRF
	6fuC6qMKEy1zIfMeY/1LO6tKuU2D8EOpIl+Cw/cDLRz0B3Yhl2gizW1KUE/Qd5u5dFgxLlbYpUW
	vBpypwS1wZdI37h8vERlTl9lthhGCD8kBcqqad80rjMfRMFqzjhQu8zEg7FarRe05q+axap+Cbt
	w5vxhSmxUB4ijPw/lY/cTwUFNOMU6mnKOKYDePcA/6V44M3IvI2tqxlqyB5D63QBMNis
X-Received: by 2002:a05:693c:880c:20b0:386:ab85:a011 with SMTP id 5a478bee46e88-386ab85a718mr8876110eec.27.1795565181421;
        Tue, 24 Nov 2026 16:06:21 -0800 (PST)
Received: from localhost ([2a00:79e0:2e7c:8:ea9b:d8a3:ba44:2d0a])
        by smtp.gmail.com with UTF8SMTPSA id a92af1059eb24-1b556840494sm38314956c88.12.2026.11.24.16.06.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 16:06:20 -0800 (PST)
From: Brian Norris <briannorris@chromium.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ulf Hansson <ulfh@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Peter Griffin <peter.griffin@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Radu Rendec <radu@rendec.net>,
	=?UTF-8?q?Jakub=20G=C5=82owacki?= <jglow@google.com>,
	linux-clk@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	devicetree@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Mariano Marciello <mmarciello@google.com>,
	google-soc@lists.linux.dev
Subject: [PATCH v2 0/9] google: Add support for Laguna CPM
Date: Tue, 24 Nov 2026 16:03:34 -0800
Message-ID: <20261125000349.3385325-1-briannorris@chromium.org>
X-Mailer: git-send-email 2.56.1.831.g720f3f5937-goog
X-Mailing-List: google-soc@lists.linux.dev
List-Id: <google-soc.lists.linux.dev>
List-Post: <mailto:google-soc@lists.linux.dev>
List-Help: <mailto:google-soc+help@lists.linux.dev>
List-Subscribe: <mailto:google-soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:google-soc+unsubscribe@lists.linux.dev>
List-Owner: <mailto:google-soc+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

== External Dependencies ==

This series depends on the bindings and mailbox-payload-definitions from
this series:

  https://lore.kernel.org/all/20261023235408.3063350-1-dianders@chromium.org/
  [PATCH v2 0/4] mailbox: Improve the mbox core then introduce the goog-mba driver

So this series cannot be applied as-is yet. Based on past feedback, I
expect the relevant dependencies shouldn't change much more before
landing.

== Internal Dependencies ==

While this series includes drivers for several subsystems, I deemed it
appropriate to keep together, because they're highly interdependent. For
example, clk, reset, and pmdomain share many of the same protocol family
details (CPM_COMMON_LPCM_SERVICE), and so it has proved useful to review
them together, to determine sensible sharing and separation strategies.
Additionally, none of pmdomain/clk/reset/irqchip (patches 3-6) build
without patch 2, and clk/pmdomain depend on the binding macros from
patch 1.

== Merge Proposal ==

Generally, Google Tensor SoC support should go through Peter Griffin's
new Tensor SoC tree
(git.kernel.org/pub/scm/linux/kernel/git/griffinp/linux.git), while
clk, pmdomain, irqchip, and reset have their own subsystem trees.

1) This series requires include/linux/mailbox/goog-mba-message.h from
   the External Dependency "mailbox: goog-mba: Introduce the goog-mba
   mailbox driver"

   This should be up to the mailbox maintainer to provide an immutable
   branch.

2) Patches 1-2 should land in Peter's Tensor tree, with an immutable
   branch for other submaintainers.

3) Patches 3-6 are independent of each other, but depend on patches 1-2.
   Subsystem maintainers should take these patches once the branch
   exists for #2.

4) Patches 7-9 should go through Peter's tree.

Alternatively, if the process is slow enough, we may not need an
immutable branch for #1.

== Description ==

The Central Power Manager (CPM) is a co-processor on the Google Tensor
SoCs, as used on Pixel phones. CPM supports power-management and a
number of other features.

The Application Processor communicates with CPM over a pair of mailbox
channels. CPM provides clock, power-domain, reset, and interrupt
services.

This series adds device tree bindings, DTS, and drivers to support CPM,
and several of the basic services provided by CPM. These services are a
minimal set needed to bootstrap many other components on the SoC --
e.g., I have a working proof-of-concept PCIe driver running on top of
this series + pinctrl (not included here). CPM provides some other
components not yet included in this series (e.g., PMIC, RTC).

This series has been tested on a Pixel 10 Pro XL (a.k.a., Mustang) both
as-is (plus the aforementioned mailbox patches), and also with minimal
additional local patches to get other components running on top
(pinctrl, PCIe, PMIC, RTC, USB), to prove out some more realistic use
cases.

- Brian

Changes in v2:
 * Move bindings to power/, not soc/
 * Make binding prefix/suffix pattern consistent (no LGA_*; put type
   first (CLK_*, PD_*))
 * Consistent naming for dt-bindings headers
 * Drop unneeded IRQ number dt-binding header (these were simply naming
   documentation, at best; I inline these into the DTS instead)
 * Drop unneeded reset number dt-binding header (these were simply
   naming documentation; I move the macro definitions directly into the
   dts/ folder instead)
 * Flatten clock IDs to a single-cell binding, as the mappings are
   complex; the mapping from clock to firmware-protocol is better done
   in the driver
 * Move more protocol details from client drivers (reset, clock,
   pmdomain) into core CPM driver
 * Simplify to a thin 'cpm_handle' for transmit-only clients
 * Support separate API to register a receive-enabled client
 * Move pmdomain per-SoC info from .h to .c file
 * Remove custom pmdomain debugfs 'state' (get/set on/off) file
 * Restructure pmdomain SoC tables for simplicity and readability
 * Simplify clock driver, to avoid memorizing rate tables and clock
   topology that is owned by the remote CPM firmware
 * Drop clock .set_rate() for now
 * Cc new google-soc@lists.linux.dev mailing list (pending MAINTAINERS
   update, separately)
 * Drop linux-samsung-soc@vger.kernel.org (this is historical, for
   earlier Tensor SoCs based on Samsung designs)
 * Added Peter's Tested-by only for 1 patch; the rest have changed
   quite a bit

Brian Norris (7):
  dt-bindings: power: google: Add Google Tensor CPM
  pmdomain: google: Add CPM power-domain driver
  clk: google: Add CPM clock driver
  reset: google: Add CPM reset driver
  arm64: dts: google: Add Laguna CPM mailbox array
  arm64: dts: google: Add Laguna CPM node
  MAINTAINERS: Add entries for CPM drivers used on Tensor SoCs

Jim Wylder (1):
  irqchip/google-cpm: Add CPM IRQ driver

Lucas Wei (1):
  soc: google: Add CPM over MailBox Array driver

 .../bindings/power/google,lga-cpm.yaml        |  68 ++
 MAINTAINERS                                   |  10 +-
 arch/arm64/boot/dts/google/lga-cpm-reset.h    | 175 ++++
 arch/arm64/boot/dts/google/lga-lpcm.h         |  54 +
 arch/arm64/boot/dts/google/lga.dtsi           |  50 +
 drivers/clk/Kconfig                           |   1 +
 drivers/clk/Makefile                          |   1 +
 drivers/clk/google/Kconfig                    |  13 +
 drivers/clk/google/Makefile                   |   3 +
 drivers/clk/google/clk-cpm-internal.h         |  35 +
 drivers/clk/google/clk-cpm-lga.c              | 223 ++++
 drivers/clk/google/clk-cpm-lga.h              | 194 ++++
 drivers/clk/google/clk-cpm.c                  | 385 +++++++
 drivers/irqchip/Kconfig                       |  10 +
 drivers/irqchip/Makefile                      |   1 +
 drivers/irqchip/irq-google-cpm.c              | 131 +++
 drivers/pmdomain/Kconfig                      |   1 +
 drivers/pmdomain/Makefile                     |   1 +
 drivers/pmdomain/google/Kconfig               |  14 +
 drivers/pmdomain/google/Makefile              |   3 +
 drivers/pmdomain/google/cpm-power-lga.c       | 365 +++++++
 drivers/pmdomain/google/cpm-power-trace.h     |  80 ++
 drivers/pmdomain/google/cpm-power.c           | 458 +++++++++
 drivers/pmdomain/google/cpm-power.h           |  42 +
 drivers/reset/Kconfig                         |   1 +
 drivers/reset/Makefile                        |   1 +
 drivers/reset/google/Kconfig                  |  11 +
 drivers/reset/google/Makefile                 |   2 +
 drivers/reset/google/reset-cpm.c              | 154 +++
 drivers/soc/Kconfig                           |   1 +
 drivers/soc/Makefile                          |   1 +
 drivers/soc/google/Kconfig                    |  13 +
 drivers/soc/google/Makefile                   |   3 +
 drivers/soc/google/google-cpm-mba-trace.h     | 163 +++
 drivers/soc/google/google-cpm-mba.c           | 956 ++++++++++++++++++
 include/dt-bindings/clock/google,lga-cpm.h    | 173 ++++
 include/dt-bindings/power/google,lga-cpm.h    |  79 ++
 include/soc/google/cpm-service-ids.h          |  84 ++
 include/soc/google/google-cpm-mba.h           | 168 +++
 include/soc/google/lga-lpcm-ids.h             |  54 +
 40 files changed, 4181 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/power/google,lga-cpm.yaml
 create mode 100644 arch/arm64/boot/dts/google/lga-cpm-reset.h
 create mode 100644 arch/arm64/boot/dts/google/lga-lpcm.h
 create mode 100644 drivers/clk/google/Kconfig
 create mode 100644 drivers/clk/google/Makefile
 create mode 100644 drivers/clk/google/clk-cpm-internal.h
 create mode 100644 drivers/clk/google/clk-cpm-lga.c
 create mode 100644 drivers/clk/google/clk-cpm-lga.h
 create mode 100644 drivers/clk/google/clk-cpm.c
 create mode 100644 drivers/irqchip/irq-google-cpm.c
 create mode 100644 drivers/pmdomain/google/Kconfig
 create mode 100644 drivers/pmdomain/google/Makefile
 create mode 100644 drivers/pmdomain/google/cpm-power-lga.c
 create mode 100644 drivers/pmdomain/google/cpm-power-trace.h
 create mode 100644 drivers/pmdomain/google/cpm-power.c
 create mode 100644 drivers/pmdomain/google/cpm-power.h
 create mode 100644 drivers/reset/google/Kconfig
 create mode 100644 drivers/reset/google/Makefile
 create mode 100644 drivers/reset/google/reset-cpm.c
 create mode 100644 drivers/soc/google/Kconfig
 create mode 100644 drivers/soc/google/Makefile
 create mode 100644 drivers/soc/google/google-cpm-mba-trace.h
 create mode 100644 drivers/soc/google/google-cpm-mba.c
 create mode 100644 include/dt-bindings/clock/google,lga-cpm.h
 create mode 100644 include/dt-bindings/power/google,lga-cpm.h
 create mode 100644 include/soc/google/cpm-service-ids.h
 create mode 100644 include/soc/google/google-cpm-mba.h
 create mode 100644 include/soc/google/lga-lpcm-ids.h

-- 
2.56.1.831.g720f3f5937-goog

