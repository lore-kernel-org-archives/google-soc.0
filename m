Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795565206;
	b=Htp+3i6CGsgvjGos2/+u3/o1f3AfXWUgkVTYekJR6RMBP4lgXg32C0fkVKAUxPA57tOM
	 6+FKG6A0yRYqDRpWp8LmARJjjZxEv6LS0IEWoyoWSFyn+ZVWh4xIg0JiCCkXmWpERs7Ot
	 Lnn8B6VzGOGSoKmTaqzu0msRPbjPoeLPym8/h0D6jN//BuKqVbHgfx3Oe46y6LPh2FwHQ
	 M9P+z9PxMFeiceVRW8YdZvWk2J0bmtzCM6U2cUpX9e1LpvwG2I2wRMGUQLG72T85M2hIt
	 Dw/bHqxswvVK7BxAp/9Xn8WwjQjJcWxUcIm6qlkyTVjPJW5YMWnfwhdig7/SqZS17Tg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795565206;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=Q+Bz0VKoiK6RD2cJswo+cvuH31ipsGl+WNFDwagvNvA=;
	b=r4H0iYuuRdOKMkRe8WeRK9LbBz2Gqcrz2MA2+dTMqxjjso2gDFkhB63Ef7Iyl1NTI8gz
	 /RCuukr0eG0ckUGdvG1tEiBU4x14RXEVImMeRKExzV34h73EUB8dZy1dFjASkAA3IsKXt
	 hCSUKF/9EhIvBDJ5a+mD5mdyf3gWL1P8151Nyj8UX7JmzlHvl9IQ9YEyNE9NFOFcA1kGg
	 RLftTdoEo3Lk5ELa8GwnBxjBy/dpQLnBXaOBftQJKXRu6c8DdPl9FLHo+EgTumi3FGA5r
	 9Rkb48topm0LkT/xgN5E7anRLnsomit2gloVPTA8pM1gjiJ5Kty5wlQYv9sFD+BYFag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=FeFN0M52;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27022606A688
	for <google-soc@lists.linux.dev>; Wed, 25 Nov 2026 00:06:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27022606A688
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=FeFN0M52
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-386ab9ab619so5828622eec.1
        for <google-soc@lists.linux.dev>; Tue, 24 Nov 2026 16:06:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795565205; x=1796170005; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Q+Bz0VKoiK6RD2cJswo+cvuH31ipsGl+WNFDwagvNvA=;
        b=FeFN0M52BBRax2TMMPcApfAhaqZ3U7acJxTqh1m3d+TP74+XD9xIq8dSeNJjwc872w
         iH9g+wbS0fl857nprkphCZZ8ZKP9HjH5sTXLkPMLaPyZhM3qNXL0FaZ60IRsaRNhBdns
         UuHDFzCl3PzMLCKQxrNM0jgOs8lPmcE0R0B7E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795565205; x=1796170005;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q+Bz0VKoiK6RD2cJswo+cvuH31ipsGl+WNFDwagvNvA=;
        b=OnfCnQsfrAZlNAINZjkps1JT5LzvLZuruNXiYj0r+xe2HgUqp5IcFYkYyEVwFkJPe8
         9bQ7v+aLW9L59FtkrJPJlO4G312IZaMcLq60zGIW8NXGY46VAVWquNtff/xDMM2IWnpr
         rilhzboubw/azZuhX7Md6tLMfMO83+C3wx8vKpX3URlSd6epHHOQlPLl8o31t+RCAXLX
         r82UUqQX88rZWYauE+w1WTQDUAreoO4ESSl0AT/WPnRPkNTV6qm0yzQ3cPGAsFlNfdcn
         /2ufxkB37t0xb9hRepT/n9lL5XKtB4j5vgb072/R/GirrCw+MSQvc/cYb8+4np+V/1D1
         xdDg==
X-Forwarded-Encrypted: i=1; AL+hErEPVUgjsfQ00yYoAV7Nv4G4PaGOQyYne3K2yzo+XleRn70brPzXFsqwE/35gC5E2CdN2nmYUqYuEIQR@lists.linux.dev
X-Gm-Message-State: APuU4Z/7SSUJMh9FEoujmsjHSx1cB3dYcSMYFoVHob6nEoqP9N0DUEBV
	mCr7TSEBE9+AehATkLisocYLiVvhvcXgHCXK6I/1cKxWuqNh864DyjugRXKUlajmKA==
X-Gm-Gg: AZFdTZd1xGK7LMwBNL0NCEO9reZ917EJB55fAjxcTOpO9XqjjBslbWxm0f7qcWIOs1F
	VhIyGQ4Lfyfh6/VFW7DuLcSpW4vcEfbNjRA9ze5OaeFFqqImRAfShRHcJu7qZiWhTCxTeRsp1Hr
	cEsTTuOnktwJ8N4pX/kw5xVrj/oVE4mZ+Q9fl1Pt4Uub5Z9Q9adYUa51cONU1mu5io7Lkim0LaB
	moDlbUenYp0b0YVuorUy8OQeaZzoj9YUwINi8o0+N7pdRHhla285Iox2uUObCFB0kPSwb8JBR4U
	M15Pes4eBJnvNSgi+MCslqFwYtsaf5y1ZPyrHigAxrRVeh33sjlTe6eSV7MMuhjD2AakG5avOcs
	oDCmQEnJDpynF+45bfNlnZwU7lscD9aeh6m/35/zpidbk3BtMPv+V2h9KAZ+SYWyOa/J1kZiQLo
	yF/pypdcCwHOXxtbDCMNfKJ1AuV8ziFFPVyA5e5B+LsAzxnalORUKVbBGxBMj+xF17DF9bN42fC
	0nvUYf+LVVTnnA771N/bwbhIKJt/mxstXDpgw7N2PKgmz/Icau28vmrsFYZt1AMLyS0940x98RC
	oyGu8Uy0y3KrHlpstSM/vYeM8fzVWEMCvfGwJa+9y6QZTFu9AxGS5ygblW+ITHHI97vaylEbbO2
	IAtF9lgjxWuzLnw==
X-Received: by 2002:a05:7301:4201:b0:385:b8f4:755d with SMTP id 5a478bee46e88-385b8f47ad3mr16518134eec.20.1795565205307;
        Tue, 24 Nov 2026 16:06:45 -0800 (PST)
Received: from localhost ([2a00:79e0:2e7c:8:ea9b:d8a3:ba44:2d0a])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-385665f21aesm59676267eec.4.2026.11.24.16.06.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 16:06:44 -0800 (PST)
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
	google-soc@lists.linux.dev,
	Brian Norris <briannorris@chromium.org>
Subject: [PATCH v2 9/9] MAINTAINERS: Add entries for CPM drivers used on Tensor SoCs
Date: Tue, 24 Nov 2026 16:03:43 -0800
Message-ID: <20261124160343.v2.9.Ibb4a0adecf127291198c372da631ff62b483a795@changeid>
X-Mailer: git-send-email 2.56.1.831.g720f3f5937-goog
In-Reply-To: <20261125000349.3385325-1-briannorris@chromium.org>
References: <20261125000349.3385325-1-briannorris@chromium.org>
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

The Google Tensor SoC known as Laguna introduces a variety of new
drivers, with Google-designed IP. Add entries to the GOOGLE TENSOR SoC
SUPPORT entry to cover the new drivers that interface with the Central
Power Manager (CPM).

Signed-off-by: Brian Norris <briannorris@chromium.org>
---

(no changes since v1)

 MAINTAINERS | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 84b47bbc0d74..ae2b8e8e004d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11509,18 +11509,26 @@ C:	irc://irc.oftc.net/pixel6-kernel-dev
 F:	Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
 F:	Documentation/devicetree/bindings/mailbox/google,lga-mailbox-array.yaml
 F:	Documentation/devicetree/bindings/phy/google,lga-usb-phy.yaml
+F:	Documentation/devicetree/bindings/power/google,*
 F:	Documentation/devicetree/bindings/soc/google/google,gs101-pmu-intr-gen.yaml
 F:	Documentation/devicetree/bindings/usb/google,lga-dwc3.yaml
 F:	arch/arm64/boot/dts/exynos/google/
 F:	arch/arm64/boot/dts/google/
+F:	drivers/clk/google/
 F:	drivers/clk/samsung/clk-gs101.c
+F:	drivers/irqchip/irq-google-*
 F:	drivers/mailbox/goog-mba*
 F:	drivers/phy/phy-google-usb.c
+F:	drivers/pmdomain/google/
+F:	drivers/reset/google/
+F:	drivers/soc/google/
 F:	drivers/soc/samsung/gs101-pmu.c
 F:	drivers/phy/samsung/phy-gs101-ufs.c
 F:	drivers/usb/dwc3/dwc3-google.c
-F:	include/dt-bindings/clock/google,gs101*
+F:	include/dt-bindings/clock/google,*
+F:	include/dt-bindings/power/google,*
 F:	include/linux/mailbox/goog-mba-message.h
+F:	include/soc/google/
 K:	[gG]oogle.?[tT]ensor
 
 GPD FAN DRIVER
-- 
2.56.1.831.g720f3f5937-goog

