Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795565201;
	b=dCqiirEXOLH6Uol6pDzhBfBgDyRJ5H9W3eSAScYTr+Z2TzGe69LTRxkWUH4HMB+Skyyf
	 jCLi8iOs2XsK9BDQw1ysi6vS88Bec0ZfpXTsWLelOohaR3IvpZAidCtEz8FGekxBj0VzB
	 bTPTRguJb57hrsEX6/PbBTZosO+7KNE9TUPhx2g3vrUtl8maGiROmW2+qBh6uZDx1oEa0
	 mMHZe+a3d6H5CLTAPWDiEVoI7Ba51NLCkOJORCH5Ua62SI+Rleyz3BtjzRG9R0X3zzgd4
	 TAE5Ahvrn9Li4La+kdPrnRfo4CnqS2F/b98ry9g5cJYTVCc/PbISYFoS8CbN6DE+7iA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795565201;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=GLPPAbg8ZJXtNBuP/olSVfNBE15bH+sF2xUL16ntd9E=;
	b=aIYGPVgxNxPW8i3prdsVtcf9EoqLDP7pyeuj9TiWzMZEFlLxEvFCEj8xJor3XDMsZqNA
	 vpXHKtu0T6u8eXmg9E7zypQ1NtvxpyXQm9LQkEJfwIf+7KA0ukcpAtUmL0rDlBUJf+3d6
	 HdQfpwl088RK00UvhBIIA/lCcQ45bNeDwdYXTsooj9GGoF1gpAYzGPsWvRD+Gv1uS3oIb
	 AROqpZtMjhAJamAKHFQbllgsLwQJe31gqTCk3WwkvJuXlFGCksbwdpMoVRIXyA3pGZ5ku
	 QMNtK/skxgzBzvBUq6kk6cqf63iT3A5A7PCLRnrFsbvD0njtosqkrcsZWcc3Y+ltaUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=nVB9awQS;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2534606A327
	for <google-soc@lists.linux.dev>; Wed, 25 Nov 2026 00:06:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2534606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=nVB9awQS
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-38190551625so10330043eec.1
        for <google-soc@lists.linux.dev>; Tue, 24 Nov 2026 16:06:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795565200; x=1796170000; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GLPPAbg8ZJXtNBuP/olSVfNBE15bH+sF2xUL16ntd9E=;
        b=nVB9awQSsvlvh16/yJ4HpKRT+uPAcFHf3+IlyUdtL3pSyNdtre+0tRlFUo/CaIzOdR
         TA1Oc0R4Py0upyi7sjZFiXZuXBUSJ+tJ8c653HBl19Mlrnilgmc1meolC3eqwp9hj1ZM
         3X4U8AtDdsKIcc3WNoNEPXHBuFinIP/LLswjI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795565200; x=1796170000;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GLPPAbg8ZJXtNBuP/olSVfNBE15bH+sF2xUL16ntd9E=;
        b=N+xL4qqLj6/3jPe2RFf8U623ZNg+6tD0JSLGlWKUyvb7gW635e3q8nR7zxd7Dv7hsa
         U4TJyKymEbKVl3p2sMfpq/zGbCaE4V38XxMVAE4D1LW1huyXGrshpR56DjIdUHwhUgb9
         rK42Hzbq+Fq7ii3G1gV3V+l7/621OO2LQGbKe9LcfuhYJCsNo557zIl+7reRUQRJmU4v
         A9DUn9niy4Mq0D0HZLXgPtzAhIIakLURUD6qL8qKvdActzWwXh5aHh/Z4KqcI172c+wT
         wG1SL15Kvp5l6mGQX5hnQb7mmZymicNuD9b/fqXsj9030RkDJZ7rnoELRhAaUw5HOKhs
         n96g==
X-Forwarded-Encrypted: i=1; AL+hErFl1BaTKZvpPL9xW43PiDasovMu+Y4lWh2aaXnuR9tZR5fTE6Ml8wx1EPwBojsm5kF4Bn1ezefmjUPr@lists.linux.dev
X-Gm-Message-State: APuU4Z8BRSdWgmqr6aaliM/go746kQ5HT+YSK3o3RQ7L02Qz7amB6DRm
	L09QogHPJ4J6ww6rQUgrE+yKB+XAzoJHuLXcmgf48E1XZ79ooagir2zbhpk+qYGqlQ==
X-Gm-Gg: AZFdTZdJzEMPkUWj6/8id7fANAIY0kXKWVas/3LmKn+zgnN4/eolAtq1x3fM1BGUh63
	3vFOV8S23sQnl7GJqZhzSWndZNUg4+MqvqLWBk/o7qRzEINhaTyMYbTgf1ieGdWZ2mHiyw7VAFO
	HVhK6Ptic4PzVUvIa/Kin9dQJ+Z0ga1CSx1w+KamjMOBg4t+8aQjxlkqqkzvoDpzzgEG0nS0rkf
	UwarpE+HJTV1tuNTinKvNx5NNzEmuX+LnNyIflFirclqz0PhGce9fy/EAcO+IZCniUbURCrEiEw
	IWQFIIAWGtrnwCXiVhOHVPCIxSDJKQ0/a41rakP1Jr8kDkz52RrgHFW2BmjJgzZAf6vyuoKkSNf
	Bd/UbhfoJ8uSlRGZ4oWTbroZkESa7hqY5sJjLHTjk8pSS1smfgBnJNYshwyj2usdu91InFAxnhU
	kG6OFwxi0kwhPYOXZtePJBTvYBk2rniP9/xyvbm2Gz00AkooALjjr+K/l6VQEvEftktGHmVz07F
	YuLnqMI3XXpbaunpNKuaj2UdXlA4aNEf5hggUlky29/dNVscTWyVJoPPoI0/XYedaEtLfemM/rE
	Pl2exHeIMCQvsjCrsg/VfQfk+1zt9uilk9KmDgN1PmkmB3bFIvh+jrlRnBIZDE/176eS
X-Received: by 2002:a05:7301:182d:b0:386:b801:cd06 with SMTP id 5a478bee46e88-386b801cd3bmr5742665eec.40.1795565199973;
        Tue, 24 Nov 2026 16:06:39 -0800 (PST)
Received: from localhost ([2a00:79e0:2e7c:8:ea9b:d8a3:ba44:2d0a])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-38566cd4efesm50070598eec.12.2026.11.24.16.06.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 16:06:39 -0800 (PST)
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
Subject: [PATCH v2 7/9] arm64: dts: google: Add Laguna CPM mailbox array
Date: Tue, 24 Nov 2026 16:03:41 -0800
Message-ID: <20261124160343.v2.7.Iaf8214205f496225013f482f6e0035e89ac624f2@changeid>
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
Content-Transfer-Encoding: 8bit

These are the request and response channels used for communicating with
the Central Power Manager (CPM) found on the Google Tensor SoC known as
Laguna.

Tested-by: Peter Griffin <peter.griffin@linaro.org> (Blazer/Frankel)
Signed-off-by: Brian Norris <briannorris@chromium.org>
---
Based on WIP bindings from:

  https://lore.kernel.org/all/20261023165211.v2.3.Ia186a29119b4b5c409815b755e0c2c3965b0495f@changeid/
  [PATCH v2 3/4] dt-bindings: mailbox: goog-mba: Add goog-mba mailbox bindings

which is part of this series:

  https://lore.kernel.org/all/20261023235408.3063350-1-dianders@chromium.org/
  [PATCH v2 0/4] mailbox: Improve the mbox core then introduce the goog-mba driver

The binding is still under review, but I include this anyway to help
prove out a working solution. This patch should not be accepted until
the binding is settled.

Changes in v2:
 * Move later in the series
 * Add Peter's Tested-by

 arch/arm64/boot/dts/google/lga.dtsi | 30 +++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/google/lga.dtsi b/arch/arm64/boot/dts/google/lga.dtsi
index 3e670e524c4c..6ceb9ea6a100 100644
--- a/arch/arm64/boot/dts/google/lga.dtsi
+++ b/arch/arm64/boot/dts/google/lga.dtsi
@@ -365,6 +365,36 @@ soc: soc@0 {
 		#address-cells = <2>;
 		#size-cells = <2>;
 
+		cpm_ap_ns_mba: mailbox-array@5240000 {
+			compatible = "google,lga-mailbox-array";
+			reg = <0x0 0x05240000 0x0 0x00010000>,
+			      <0x0 0x05250000 0x0 0x00010000>;
+			ranges = <0x0 0x0 0x05260000 0x00020000>;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			cpm_ap_ns_req_mba: mailbox@0 {
+				reg = <0x00000 0x1000>;
+				interrupts = <GIC_SPI 250 IRQ_TYPE_LEVEL_HIGH 0>;
+
+				#mbox-cells = <0>;
+
+				google,tx-payload-words = <4>;
+				google,mba-queue-mode;
+			};
+
+			cpm_ap_ns_resp_mba: mailbox@1000 {
+				reg = <0x01000 0x1000>;
+				interrupts = <GIC_SPI 251 IRQ_TYPE_LEVEL_HIGH 0>;
+
+				#mbox-cells = <0>;
+
+				google,rx-payload-words = <4>;
+				google,mba-queue-mode;
+			};
+		};
+
 		gic: interrupt-controller@5880000 {
 			compatible = "arm,gic-v3";
 			reg = <0x0 0x05880000 0x0 0x10000>,
-- 
2.56.1.831.g720f3f5937-goog

