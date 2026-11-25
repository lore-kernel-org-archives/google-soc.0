Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795565196;
	b=oeQTJGLXVjuCh7eepG6lJDVbNiPuwjdnXOvLV5ckBJwTbo1G2NcCtD2bagvVhpIaaho0
	 8R8ABG3SBzQKxhbpZrdMvzJaU2bUAO9uuiOgcONpmRn+b7y9rhqBsFbUyQtahVkL5aPuy
	 RitWZa0Wk8RDlGaqQxBKkHgNFvIKUr3CzJpzKx0Jf8k57vv+GJUf/x7T1Gxg21Q3tH2jx
	 H+K8ZUivLziOjpTaBBA7AmeZicPsb28vBrt//JQyl4Tte7GoJ466Rw4Q4SMZxQI8vrZfG
	 C7GxIggIHKH2K3i3R9Pozqc2LjH7wR3tjiZI0jGCUYYYVcXmkQbGPRoM8xmeoNQ8kLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795565196;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=EwqXgM2FKN08CB+8H4O0/VbJ4ckFqMzW77Fps/c3mB0=;
	b=rGx2a+9ViO3jDpyl+kD6F4IF9sc8tgGt8BE36oysnFkVncCtZLb/alCb9Fexj1IgXhkV
	 2LCRTxUkx8ZX3cnkPSO+wDGQDc7A0FrzRYcjaD+LxeD5E/2XBlZt7zB46hNv4nshDRFN7
	 M+m5mUge/jB1OyPqD9HyVRHSnSzB9dATWaxVNUnGZeB2lbsV6x04tlEjA7R/qwbaA9ne4
	 /4oXlAsTKLbgcNyHg63OZjxydx7GbpT4tNs8nhWwhUm9VgdLmKZDY8lCyMAjJ1oQTyFIC
	 fYP2xUtGG151OQpJeDn6Bm+AyaMXMIIyY+8KxV8KhRlJuzOCiGWbRMTH6b7BORt6Xeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Gl4tI4fs;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2014606A693
	for <google-soc@lists.linux.dev>; Wed, 25 Nov 2026 00:06:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2014606A693
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Gl4tI4fs
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-3863db981d4so7124072eec.0
        for <google-soc@lists.linux.dev>; Tue, 24 Nov 2026 16:06:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795565195; x=1796169995; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EwqXgM2FKN08CB+8H4O0/VbJ4ckFqMzW77Fps/c3mB0=;
        b=Gl4tI4fsGnJwpYqUb6qzDTvfoBKKmPXH4rfCIAlXrKQcTzEL/RR7IkdgGDn4WfICUO
         gyoXeHowfsb9W6DD8SsxIetWZL5eGELC97XGpPnJCcBR57D+OToYPKBWk8RMQa3laVxU
         6TgqqEmS7ZG+ODVo+YKsFyd7zu2FcNydJKXAk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795565195; x=1796169995;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EwqXgM2FKN08CB+8H4O0/VbJ4ckFqMzW77Fps/c3mB0=;
        b=d5L2y3J8PINbj1AD2EGhEmw11+DbE0gRqBi6uIKZIFSLs3Ae0y2kValZNEvesny48j
         MEx+jJqCGNvvElwYWbepLlCttIbDw9HWQlc+8DSufpoWDKPVoQgGXrkWfZ/qW+mnbviy
         vKsEFyHAzsRbbCByRHKBcru9FK285k0iyHFY9IR49fM9BwwXioiHE3+gBm+teON9WJSK
         AIka5qp40qGAIb/aY4McPTPcPvKBbSUW95x1Bum+L0tOAjsTLX3xLFOYODPpc9P7Lzis
         AoOq5AlvG3joa7hU/gcYj4z6L7DDMdJdlmFEHH54MniTUCYC04fEcjdCK/otX2tsyQBC
         kURQ==
X-Forwarded-Encrypted: i=1; AL+hErE357zAP3uP4VGjHGyXtaUU/NE2niEHskjckbtqqZUNH/ZJkTZk2C3hqKB1vvR+ebCPxEyFFdlEDbw+@lists.linux.dev
X-Gm-Message-State: APuU4Z+2iGHwkicGFAaTPkLjOYcgsqabOT7BaT9j8Leza8eF+8HMYQXq
	00WiQQR5upw5bJkw8zSE7q07C+fJYLGAm31g3UwV8dSEt9SppkIqFAgTVYO9LcEQ2g==
X-Gm-Gg: AZFdTZcy7Q7T+O+TgQzNnEJIUvFBuj3sF4fkCBdoHZ6yc50CHsByJEuhITZ8BIuPeEG
	NPYjxQX8k5mhyWNRmCMdKO7CLgFHxPxgtbmeXwRAau4afGBgEDvRXMMTQ8D2UnEFYkoKdzH02t3
	QGLbmhO5AOPPGq3t2rWc/rX3Yn3ffy6MENzMeIlcZ3lafvX5hYfq67ZPCg6i5e6K+sM0+sLeZAj
	6wvm+b4RTsSb4qFEzqBaRqTamrG+QID8BnoD3qGeUJWlw+wTcM3JXS4NpF0URJ7cwQVY8s9GB6A
	XsYjEGTAfygqj6FDceJzYMPhEIn4jp3z42GRSpfhjzDAtCybviR5PTvlzeSdTgDBxwP0c/Bf5Og
	CJ1aG8l8zWpx6gAkAMzRrFY2GmNrItYGa4+HwrU98xAd1Q4J9iggE/ffgCmJdP/5MT8rUviBbdW
	qudODjIKanzlROLfvGig3puglo9nF2VxWiGohT99j8PHc8J6QQNZkOhsIe8JlF7XHRQWv7PPxeS
	88f9ZH1fvKHLb4dRlQLT7hewmSFMhZQcCYw1TUsvueNSoeGZyYk6/yGxVSU6woNDxWM4VyHPzr4
	5hZ6qljLO5d5Af7ll6bukJsTiiWdZFdgItn+7YDr/DRTv/7YcEZSJwWa+8zdiVPRv9zUVQ==
X-Received: by 2002:a05:7301:78c1:b0:386:a3fe:44de with SMTP id 5a478bee46e88-386a3fe4616mr10456351eec.28.1795565194862;
        Tue, 24 Nov 2026 16:06:34 -0800 (PST)
Received: from localhost ([2a00:79e0:2e7c:8:ea9b:d8a3:ba44:2d0a])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-38567abb870sm40418219eec.25.2026.11.24.16.06.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 16:06:34 -0800 (PST)
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
Subject: [PATCH v2 5/9] reset: google: Add CPM reset driver
Date: Tue, 24 Nov 2026 16:03:39 -0800
Message-ID: <20261124160343.v2.5.I0b1ad34a718a9b5f667d2481041970ea45989dd3@changeid>
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

Google Tensor SoCs (used on Pixel phones) manage many resources
(including resets) using a Central Power Manager (CPM) co-processor. We
communicate with CPM using mailboxes, abstracted in the
devm_cpm_get_handle(), etc., API.

For posterity, I list a summary of changes made relative to the
downstream Pixel driver:

* Switch to auxiliary bus, as a child of a CPM device

* Use devm more heavily

* Avoid representing each reset as its own Device Tree node.

Signed-off-by: Brian Norris <briannorris@chromium.org>
---

Changes in v2:
 * Rename symbols from goog_cpm_rst_* to cpm_reset_*
 * Moved shared protocol details to CPM driver
 * Remove custom reset debugfs interface and .remove callback.
 * Remove per-SoC table; we only need naive translation of firmware IDs

 drivers/reset/Kconfig            |   1 +
 drivers/reset/Makefile           |   1 +
 drivers/reset/google/Kconfig     |  11 +++
 drivers/reset/google/Makefile    |   2 +
 drivers/reset/google/reset-cpm.c | 154 +++++++++++++++++++++++++++++++
 5 files changed, 169 insertions(+)
 create mode 100644 drivers/reset/google/Kconfig
 create mode 100644 drivers/reset/google/Makefile
 create mode 100644 drivers/reset/google/reset-cpm.c

diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index 673bca1e594e..64c12b479b2c 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -475,6 +475,7 @@ config RESET_ZYNQMP
 	  This enables the reset controller driver for Xilinx ZynqMP SoCs.
 
 source "drivers/reset/amlogic/Kconfig"
+source "drivers/reset/google/Kconfig"
 source "drivers/reset/hisilicon/Kconfig"
 source "drivers/reset/realtek/Kconfig"
 source "drivers/reset/spacemit/Kconfig"
diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
index 2fe527a7be8e..a151fe63905e 100644
--- a/drivers/reset/Makefile
+++ b/drivers/reset/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-y += core.o
 obj-y += amlogic/
+obj-y += google/
 obj-y += hisilicon/
 obj-y += realtek/
 obj-y += spacemit/
diff --git a/drivers/reset/google/Kconfig b/drivers/reset/google/Kconfig
new file mode 100644
index 000000000000..38431b4f9001
--- /dev/null
+++ b/drivers/reset/google/Kconfig
@@ -0,0 +1,11 @@
+# SPDX-License-Identifier: GPL-2.0-only
+config RESET_CPM
+	tristate "Google CPM Reset Controller"
+	depends on ARCH_GOOGLE || COMPILE_TEST
+	depends on GOOGLE_CPM_MBA
+	help
+	  Driver support for reset controllers found on Google Tensor SoCs,
+	  operating over the CPM mailbox interface. This allows peripheral
+	  drivers to assert and deassert resets on LPCM hardware blocks.
+
+	  If unsure, say N.
diff --git a/drivers/reset/google/Makefile b/drivers/reset/google/Makefile
new file mode 100644
index 000000000000..437c19459464
--- /dev/null
+++ b/drivers/reset/google/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0-only
+obj-$(CONFIG_RESET_CPM) += reset-cpm.o
diff --git a/drivers/reset/google/reset-cpm.c b/drivers/reset/google/reset-cpm.c
new file mode 100644
index 000000000000..ef0863f25cac
--- /dev/null
+++ b/drivers/reset/google/reset-cpm.c
@@ -0,0 +1,154 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Device driver to control Google SoC LPCM resets via CPM.
+ * Copyright 2023-2026 Google LLC
+ */
+
+#include <linux/auxiliary_bus.h>
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/container_of.h>
+#include <linux/dev_printk.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/errno.h>
+#include <linux/gfp_types.h>
+#include <linux/limits.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/reset-controller.h>
+#include <linux/types.h>
+#include <soc/google/google-cpm-mba.h>
+
+#define ASSERT_OP_ID			0
+#define DEASSERT_OP_ID			1
+
+#define CPM_RST_LPCM_ID_MASK		GENMASK(31, 16)
+#define CPM_RST_ID_MASK			GENMASK(15, 0)
+/* Object fields are 8 bits */
+#define CPM_RST_ID_MAX			U8_MAX
+
+static inline unsigned long to_rstc_idx(u32 lpcm_id, u32 rst_id)
+{
+	return FIELD_PREP(CPM_RST_LPCM_ID_MASK, lpcm_id) |
+	       FIELD_PREP(CPM_RST_ID_MASK, rst_id);
+}
+
+static inline u32 lpcm_from_idx(unsigned long idx)
+{
+	return FIELD_GET(CPM_RST_LPCM_ID_MASK, idx);
+}
+
+static inline u32 rst_from_idx(unsigned long idx)
+{
+	return FIELD_GET(CPM_RST_ID_MASK, idx);
+}
+
+struct cpm_reset_provider {
+	struct reset_controller_dev rcdev;
+	struct cpm_handle *cpm;
+};
+
+static inline struct cpm_reset_provider *to_provider(struct reset_controller_dev *rcdev)
+{
+	return container_of(rcdev, struct cpm_reset_provider, rcdev);
+}
+
+static int cpm_reset_send_lpcm(struct reset_controller_dev *rcdev,
+			       unsigned long idx, u8 opcode)
+{
+	struct cpm_reset_provider *provider = to_provider(rcdev);
+	const struct cpm_lpcm_message msg = {
+		.cmd = LPCM_CMD_SET_RST,
+		.opcode = opcode,
+		.lpcm_id = lpcm_from_idx(idx),
+		.obj_id = rst_from_idx(idx),
+	};
+
+	return cpm_send_lpcm_message(provider->cpm, &msg);
+}
+
+static int cpm_reset_assert(struct reset_controller_dev *rcdev,
+			    unsigned long idx)
+{
+	return cpm_reset_send_lpcm(rcdev, idx, ASSERT_OP_ID);
+}
+
+static int cpm_reset_deassert(struct reset_controller_dev *rcdev,
+			      unsigned long idx)
+{
+	return cpm_reset_send_lpcm(rcdev, idx, DEASSERT_OP_ID);
+}
+
+static const struct reset_control_ops cpm_reset_ops = {
+	.assert = cpm_reset_assert,
+	.deassert = cpm_reset_deassert,
+};
+
+static int cpm_reset_of_xlate(struct reset_controller_dev *rcdev,
+			      const struct of_phandle_args *reset_spec)
+{
+	u32 lpcm_id, rst_id;
+
+	if (reset_spec->args_count != 2)
+		return -EINVAL;
+
+	lpcm_id = reset_spec->args[0];
+	rst_id = reset_spec->args[1];
+
+	if (lpcm_id > CPM_RST_ID_MAX)
+		return -EINVAL;
+	if (rst_id > CPM_RST_ID_MAX)
+		return -EINVAL;
+
+	return to_rstc_idx(lpcm_id, rst_id);
+}
+
+static int cpm_reset_probe(struct auxiliary_device *auxdev,
+			   const struct auxiliary_device_id *id)
+{
+	struct device *dev = &auxdev->dev;
+	struct cpm_reset_provider *provider;
+	int ret;
+
+	provider = devm_kzalloc(dev, sizeof(*provider), GFP_KERNEL);
+	if (!provider)
+		return -ENOMEM;
+
+	provider->cpm = devm_cpm_get_handle(dev);
+	if (IS_ERR(provider->cpm))
+		return dev_err_probe(dev, PTR_ERR(provider->cpm),
+				     "Failed to get CPM handle\n");
+
+	provider->rcdev.dev = dev;
+	provider->rcdev.owner = THIS_MODULE;
+	provider->rcdev.of_node = dev->of_node;
+	provider->rcdev.ops = &cpm_reset_ops;
+	provider->rcdev.of_reset_n_cells = 2;
+	provider->rcdev.of_xlate = cpm_reset_of_xlate;
+
+	ret = devm_reset_controller_register(dev, &provider->rcdev);
+	if (ret < 0) {
+		dev_err(dev, "failed to register reset controller: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static const struct auxiliary_device_id cpm_reset_id_table[] = {
+	{ .name = "google_cpm_mba.reset" },
+	{}
+};
+MODULE_DEVICE_TABLE(auxiliary, cpm_reset_id_table);
+
+static struct auxiliary_driver cpm_reset_driver = {
+	.probe = cpm_reset_probe,
+	.name = "google-reset-cpm",
+	.id_table = cpm_reset_id_table,
+};
+module_auxiliary_driver(cpm_reset_driver);
+
+MODULE_DESCRIPTION("Google CPM Reset Driver");
+MODULE_LICENSE("GPL");
-- 
2.56.1.831.g720f3f5937-goog

