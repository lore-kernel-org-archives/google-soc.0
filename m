Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795638303;
	b=E5PgFAvMsOlOOGTVY6TNBdC0mVN5X2Zb8WR/8ViM0d4uOl/YZh8LH4Wq4+XA/s0fSlV1
	 mHZuSycNpx6bfuNRJigzjRiyRKpnmmE3bDg/mCfy8uPRLrEJxPwUA644r8BLf6iKvrrMk
	 izRtcKl66H9sWwrHRamZGt/kHmOeM0a4KaXEQSsndKIsYYc3DTqEoYmi+p3wo+yB/h0i5
	 d1QNnjKQKKQhjR10V7AO9LbVlcW/SGJ9EEXB/PJDy6vc+z2LuUjseOUWo/mfGjdsWSqIo
	 kaZsaVeUOY6esmRn5bfNNFydfdqhBJs0mY1I8TDitSt+iiOBTeS14bKMHhS5yDZ59OQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795638303;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=mDhvBvovwpJTge71NdthCCdTa9trxCPJhLZ+RIaHARI=;
	b=pbKpQ7dSwvmj3id2u/PKRcpqgwB5Andp5bGN9NmD09y6u9mR6dZMgZdBBugaGv0qb4KI
	 Jol1EuusVnP/9IRT5iZ4PuD7dQ+QFHU0Oy69QEjHItwO6OvG1mjJUPI2Pfmg0BG956RkN
	 2ewZ/bG9tD/Uk3s6GfOG5AKhy5tJrlGbThjhQ1+hz63osttjfcoJhM+kzOSx4rup9Flex
	 /yCECD7aalsbRutUVs+9geOBuvhZtxXPR0rukgviG5Q99tGiYzpuNu3luU5jOIYO22OAf
	 VVLYlWtwWpjdCyfv6xFhiaR+gr0gAcFXze4+Z3NqzcskWJS+OxV3WrIbKCQrp0LgA+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=apq9hlf6;
	arc=none smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19FEA606A321
	for <google-soc@lists.linux.dev>; Wed, 25 Nov 2026 20:25:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19FEA606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=apq9hlf6
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c5133831027so887007966b.2
        for <google-soc@lists.linux.dev>; Wed, 25 Nov 2026 12:25:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795638301; x=1796243101; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mDhvBvovwpJTge71NdthCCdTa9trxCPJhLZ+RIaHARI=;
        b=apq9hlf6OilKCO0ATDcQC26kIdqK9lFYT79MijiRqx8ON/g6hz5b/lcSJ04Ewnk666
         wFan1f33lgkz6sJab6Lezkyzux/+u+m8Ny4JNWvMoxdXzrCm4d/eTrNiXzjJdhKumGj5
         5kn5eAoHhxItMsgZc/rQU5o0N27OAWR/3jnDU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795638301; x=1796243101;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mDhvBvovwpJTge71NdthCCdTa9trxCPJhLZ+RIaHARI=;
        b=zlO19Q9wRCbbfUlWtpUsobMWXgI1EoyWr8SWDBHMyBCeAsy9MJRZyn20XTjZOTqObW
         fAFZ0KQQ6/fURZ7ip0+sdgZjBe1uC/z8XvuTxtyPccZeY2Zzis3ynfGwHpS1ZJGx0oQw
         +wA9HEbUizjoXXXsRzn6ZxplOkINQLWqbJtfH9hqcK2v+a/Ar3NQb/ggLfaHeMELTTkJ
         nvMAN1WgEiMu+yJCLZYZuUcScfdccKe/3RD8EwsAYsIo68ZcIgOiS7/bUWnI8MB057vO
         frm1Y7PhgiuFCzig3PfRZkh6D6sHW9A8gfdJxICZkyVy5tC9DuAX2ITdqpeDlcBxE/wM
         WmEw==
X-Forwarded-Encrypted: i=1; AL+hErFe4zrGWLDbbRrNEkvo2rqZj1HJTEYPgpmbXCAAEdlDfDSaXHId4R6+7slmQ0daDmo+qXCH+I60Gb+l@lists.linux.dev
X-Gm-Message-State: APuU4Z8NewkRCZrgxgoN0Vzlboj95A56TOIASEuXbCTek/xzVLUGBJUf
	U5nawJd80cR13IhXhx92aJuB/mNzUhYnWAKF3RubH+Rb8UjDl4FfOGdv2S2jRgYMfZBSTQ8RNdk
	GsDIxDwzY
X-Gm-Gg: AZFdTZeYXGj3ba1tzNL4xQSGjzEInEyMDTGXS1zf+6NqpefTq/WnqFyg7G7ZA3279oD
	pC2pelLvKUo+v1wq99iQjAewGr3praZFiXd0jFEUKjZoull9XqwFzltVqsrOvwRAcN1b8bR1EsL
	xk2qcz3M5qqIBtWTZ50egMLRPJGsh7a/wa/tx+MvRCwJOfmCL/n/YQM/0HNuGoqbdV9Wg2IZF3a
	mTb/YQ75FnRxhs3DcYAizS0jie9vPCiIJGFYVyFUL+FMlcLQmuYHxwSgcNOjfNQ1sPkPrRd4eHE
	MoxdofGQMDGi5nf5aN+Xf7qOm8/5P17u18fPjSCPfIbtRy0DAJdaGPEY3QuhIPGfPLTBnen1v6t
	3ayUqoVc+E04gqY+v8pOkBEuKTUtZ4ANKWChCaCLoltDsHvMzvWCB/rda5S6Ra1fGP1sTUm/Jqs
	BTEqqaBadb4rvkwXv1sm7d6xuIFDhetUsTlY5rsrqO+/JAhBAC/Uwc/CpMtL/Lv7QuqFFyK5Q8s
	Y3n6h6dimD+JEuBGDfIjkcXTVKtXDjNxJUltRgsAuy520rXsBVhD64vMCtWnJBlpnUnRnaEwuiW
	n0fgL98k+yTTKi/5tQwN8DIeaZ2VnxpLFnMnjL446Yk7AtWkj1AGKvSNxPZO6O1aGiJXJpwF2R8
	uRE+VfLZB6XovBw==
X-Received: by 2002:a17:906:26cd:b0:c41:26b8:c49c with SMTP id a640c23a62f3a-c513a5db1d6mr1216458366b.10.1795638301195;
        Wed, 25 Nov 2026 12:25:01 -0800 (PST)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com. [209.85.221.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513aea17desm681454166b.44.2026.11.25.12.24.58
        for <google-soc@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 12:24:59 -0800 (PST)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4a42b34e930so5438372f8f.2
        for <google-soc@lists.linux.dev>; Wed, 25 Nov 2026 12:24:58 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGVS6Ui5L4r/0UD+PldWcNw9cHcd9vJgmhRSv3P48Eu2y1biaTtV9Xz7xwjk/qgV80GQH1zr9mZJRui@lists.linux.dev
X-Received: by 2002:a05:600c:8210:b0:4a2:1a:a116 with SMTP id
 5b1f17b1804b1-4bb887865b5mr380873225e9.0.1795638297387; Wed, 25 Nov 2026
 12:24:57 -0800 (PST)
X-Mailing-List: google-soc@lists.linux.dev
List-Id: <google-soc.lists.linux.dev>
List-Post: <mailto:google-soc@lists.linux.dev>
List-Help: <mailto:google-soc+help@lists.linux.dev>
List-Subscribe: <mailto:google-soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:google-soc+unsubscribe@lists.linux.dev>
List-Owner: <mailto:google-soc+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261115180147.1208082-1-vamshigajjela@google.com> <20261115180147.1208082-3-vamshigajjela@google.com>
In-Reply-To: <20261115180147.1208082-3-vamshigajjela@google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 25 Nov 2026 12:24:45 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VJwuHaRhWGMHyPgudyB9ocdW8nzxYFdW5o+UKxn8x2RQ@mail.gmail.com>
X-Gm-Features: Aa3M54reZu_rV6EQr2mwr095PUCfeijuzUgiyBLvGVjyYCOWWagODc3ImgmqMIk
Message-ID: <CAD=FV=VJwuHaRhWGMHyPgudyB9ocdW8nzxYFdW5o+UKxn8x2RQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] spmi: Add SmartDV SPMI controller driver
To: vamshi gajjela <vamshigajjela@google.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Peter Griffin <peter.griffin@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Jim Wylder <jwylder@google.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, google-soc@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi,

On Sun, Nov 15, 2026 at 10:01 AM vamshi gajjela
<vamshigajjela@google.com> wrote:
> diff --git a/drivers/spmi/Kconfig b/drivers/spmi/Kconfig
> index a80cf4047b86..e20fcc9f2c68 100644
> --- a/drivers/spmi/Kconfig
> +++ b/drivers/spmi/Kconfig
> @@ -54,4 +54,14 @@ config SPMI_MTK_PMIF
>    This is required for communicating with Mediatek PMICs and
>    other devices that have the SPMI interface.
>
> +config SPMI_SMARTDV
> + tristate "SmartDV Technologies SPMI Controller"
> + depends on HAS_IOMEM

Please add:

depends on ARCH_GOOGLE || COMPILE_TEST

Right now "google,lga-spmi" is the only compatible string supported,
and that matches how the other controller drivers in this Kconfig file
are scoped. When another SoC family is added later, its ARCH_* symbol
can be added here too.

> [...]
> diff --git a/drivers/spmi/spmi-smartdv.c b/drivers/spmi/spmi-smartdv.c
> new file mode 100644
> index 000000000000..d4671667596e
> --- /dev/null
> +++ b/drivers/spmi/spmi-smartdv.c
> [...]
> +/* SPMI controller CONTROL register bit masks */
> +#define SPMI_CONTROL_MASTER_EN BIT(0)
> +#define SPMI_CONTROL_ARB_ENABLE_MASK BIT(1)

nit: SPMI_CONTROL_MASTER_EN omits the _MASK suffix for a single BIT(),
whereas single-bit flags like SPMI_CONTROL_ARB_ENABLE_MASK,
SPMI_REQ_COMMAND_NEW_CMD_MASK, and SPMI_REQ_COMMAND_PRIMARY_ARB_MASK
keep _MASK. Dropping _MASK on single-bit BIT() definitions would be
more consistent.

> [...]
> +#define SPMI_IRQ_ARB_REQ_TIMER_TIMEOUT BIT(10)
> +#define SPMI_IRQ_IS_BOM BIT(11)
> +#define SPMI_IRQ_CONNECTED BIT(12)
> +
> +#define SPMI_ANY_ERROR_IRQ_FLAG \
> + ( \
> + SPMI_IRQ_ABORT_MST_CMD | \
> + SPMI_IRQ_READ_DATA_PAR_ERR | \
> + SPMI_IRQ_READ_NO_RESP_ERR | \
> + SPMI_IRQ_CMD_NACK_ERR | \
> + SPMI_IRQ_BUS_TIMEOUT | \
> + SPMI_IRQ_NO_BOM_CMD_PAR_ERR | \
> + SPMI_IRQ_NO_BOM_ADDR_LO_PAR_ERR | \
> + SPMI_IRQ_NO_BOM_WR_DATA_PAR_ERR \
> + )

SPMI_IRQ_ARB_REQ_TIMER_TIMEOUT is defined right above
SPMI_ANY_ERROR_IRQ_FLAG, but isn't included in it. Shouldn't an
arbitration request timer timeout also be treated as an error?

> [...]
> +#define REQ_COMMAND_TIMEOUT_MS 100
> +#define REQ_COMMAND_TIMEOUT_US (REQ_COMMAND_TIMEOUT_MS * USEC_PER_MSEC)
> +#define REQ_COMMAND_POLL_US 1

100 ms is a very long time to busy-poll with readl_poll_timeout_atomic()
while holding spin_lock_irqsave(). If a target stops responding or the
bus hangs, a CPU will sit with local interrupts disabled for 100 ms.

At 2.4 MHz SCL, even a full 16-byte SPMI transfer is under 100 us on
the wire, and other SPMI controller drivers (spmi-pmic-arb,
hisi-spmi-controller, spmi-mtk-pmif) use timeouts of 1 ms to 10 ms.
Can this be lowered to something in the 1-10 ms range?

> [...]
> +struct smartdv_spmi {
> + struct spmi_controller *ctrl;
> + struct device *dev;
> + void __iomem *base;
> + spinlock_t lock; /* Serialize bus access */
> + struct clk *i_clk;
> + struct reset_control *rst;
> + unsigned long clk_freq;
> + u32 ctrl_reg;
> +};

nit: ctrl, i_clk, rst, and clk_freq are never used after probe() (and
platform_set_drvdata() in smartdv_spmi_probe() has no corresponding
reader either). Keeping clk, rst, and clk_freq as locals during probe
would trim struct smartdv_spmi down to the fields actually used at
runtime.

> [...]
> +static int smartdv_spmi_wait_for_done(struct smartdv_spmi *sdrv, u32 *irq_status)
> +{
> + int ret;
> +
> + /* wait for cmd done status */
> + ret = readl_poll_timeout_atomic(sdrv->base + IRQ_STATUS, *irq_status,
> + (*irq_status & SPMI_IRQ_REQ_CMD_DONE) != 0,
> + REQ_COMMAND_POLL_US, REQ_COMMAND_TIMEOUT_US);
> + /* clear all interrupts */
> + smartdv_spmi_writel(sdrv, IRQ_STATUS, *irq_status);
> +
> + return ret;
> +}

Does the hardware guarantee that SPMI_IRQ_REQ_CMD_DONE is always set
even on fault conditions like SPMI_IRQ_ABORT_MST_CMD,
SPMI_IRQ_BUS_TIMEOUT, or SPMI_IRQ_ARB_REQ_TIMER_TIMEOUT? Or should the
poll condition check:

*irq_status & (SPMI_IRQ_REQ_CMD_DONE | SPMI_ANY_ERROR_IRQ_FLAG)

so that an error terminates the poll immediately rather than spinning
until timeout?

> +
> +static int smartdv_spmi_xfer(struct smartdv_spmi *sdrv,
> +     enum smartdv_spmi_xfer_type xfer_type,
> +     u8 opc, u8 sid, u16 saddr, size_t bc)
> +{
> + u32 irq_status;
> + u32 cmd = 0;
> + int ret;
> +
> + /* program control register, master enable */
> + smartdv_spmi_writel(sdrv, CONTROL, sdrv->ctrl_reg | SPMI_CONTROL_MASTER_EN);

Two questions/issues here:

1. IRQ_STATUS is never cleared in probe() or before writing REQ_COMMAND.
If an earlier boot stage left SPMI_IRQ_REQ_CMD_DONE latched, or if a
previous command timed out and finished on the bus right after
smartdv_spmi_wait_for_done() returned, the next transfer will see the
stale SPMI_IRQ_REQ_CMD_DONE bit immediately, read zeros out of
REQ_DATA0..3, and clear SPMI_CONTROL_MASTER_EN while the new frame is
still in flight. Clearing stale IRQ_STATUS bits before issuing
REQ_COMMAND (and after disabling MASTER_EN on timeout) would prevent
that.

2. Is there a hardware reason to toggle SPMI_CONTROL_MASTER_EN on and
off around every single transfer instead of enabling it once in probe()
(reprogramming CONTROL on resume if needed, and disabling via
devm_add_action_or_reset())?

> +
> + /* prepare req_command register */
> + cmd |= SPMI_REQ_COMMAND_NEW_CMD_MASK;
> + cmd |= SPMI_REQ_COMMAND_PRIMARY_ARB_MASK;
> + cmd |= FIELD_PREP(SPMI_REQ_COMMAND_OPCODE_MASK, opc);
> + cmd |= FIELD_PREP(SPMI_REQ_COMMAND_ADDR_MASK, sid);
> +
> + if (xfer_type != SMARTDV_SPMI_XFER_CMD) {
> + cmd |= FIELD_PREP(SPMI_REQ_COMMAND_BYTE_CNT_MASK, bc - 1);
> + cmd |= FIELD_PREP(SPMI_REQ_COMMAND_REQ_ADDR_MASK, saddr);
> + }
> +
> + /* request new command */
> + smartdv_spmi_writel(sdrv, REQ_COMMAND, cmd);
> +
> + ret = smartdv_spmi_wait_for_done(sdrv, &irq_status);
> + if (ret) {
> + dev_err(sdrv->dev, "request timeout.\n");
> + goto out;
> + }

nit: drop the trailing period in "request timeout.\n" to match the rest
of the driver, and consider logging sid, opc, saddr, and irq_status
here too like the error path below so it's clear which target timed
out.

> [...]
> +static int smartdv_spmi_read_cmd(struct spmi_controller *ctrl,
> + u8 opcode, u8 sid, u16 saddr, u8 *__buf, size_t bc)
> +{
> + struct smartdv_spmi *sdrv = spmi_controller_get_drvdata(ctrl);
> + unsigned long flags;
> + int ret;
> + u8 opc;
> +
> + switch (opcode) {
> + case SPMI_CMD_READ:
> + opc = SMARTDV_SPMI_CMD_REG_READ;
> + break;
> + case SPMI_CMD_EXT_READ:
> + opc = SMARTDV_SPMI_CMD_EXT_REG_READ;
> + break;
> + case SPMI_CMD_EXT_READL:
> + opc = SMARTDV_SPMI_CMD_EXT_REG_READ_L;
> + break;
> + default:
> + dev_err(&ctrl->dev, "invalid cmd %#x\n", opcode);
> + return -EINVAL;
> + }
> +
> + spin_lock_irqsave(&sdrv->lock, flags);
> +
> + /* clear req_data registers by writing zeros */
> + smartdv_spmi_clear_req_data_reg(sdrv);
> +
> + /* clear read status register */
> + smartdv_spmi_writel(sdrv, REQ_RD_STATUS, 0x0);

A few things in smartdv_spmi_read_cmd() (most apply to
smartdv_spmi_write_cmd() too):

1. Even though spmi-core currently bounds lengths to 1..16 in
spmi_ext_register_*(), REQ_DATA0..REQ_DATA3 is only 16 bytes and
REQ_RD_STATUS sits immediately at REQ_DATA3 + 4 (0x24), plus bc - 1
underflows if bc == 0. Please add a defensive bounds check (e.g.
!bc || bc > SMARTDV_SPMI_MAX_BYTES) in read_cmd and write_cmd like
spmi-pmic-arb, spmi-mtk-pmif, and hisi-spmi-controller do, so
smartdv_spmi_write_req_data() can never walk past REQ_DATA3 into
adjacent CSRs.

2. You clear REQ_RD_STATUS before a read, which is nice, but
smartdv_spmi_read_err_status_dump() also logs RD_ERR_INDEX. Should
RD_ERR_INDEX be cleared to 0 here too so an error dump doesn't report
stale bits from an earlier failed read?

3. nit: rename __buf to buf in both smartdv_spmi_read_cmd() and
smartdv_spmi_write_cmd() (there is no local buf variable shadowing it),
and consider guard(spinlock_irqsave)(&sdrv->lock) from
<linux/cleanup.h>.

4. nit: "invalid read cmd %#x\n" here to match "invalid write cmd %#x\n"
in smartdv_spmi_write_cmd().

> [...]
> +static int smartdv_spmi_init_clk_reset(struct smartdv_spmi *sdrv)
> +{
> + struct device *dev = sdrv->dev;
> +
> + sdrv->i_clk = devm_clk_get_enabled(dev, NULL);
> + if (IS_ERR(sdrv->i_clk))
> + return dev_err_probe(dev, PTR_ERR(sdrv->i_clk), "could not get i_clk\n");
> +
> + sdrv->clk_freq = clk_get_rate(sdrv->i_clk);
> + if (!sdrv->clk_freq)
> + return dev_err_probe(dev, -EINVAL, "i_clk rate not defined\n");
> +
> + sdrv->rst = devm_reset_control_get_exclusive_deasserted(dev, NULL);
> + if (IS_ERR(sdrv->rst))
> + return dev_err_probe(dev, PTR_ERR(sdrv->rst),
> +     "could not get and deassert reset\n");
> +
> + return 0;
> +}

1. The reset needs to be optional:

devm_reset_control_get_optional_exclusive_deasserted(dev, NULL);

I saw from the v1 review that resets was made required for v2, but on
Tensor G5 only the LSIO_E SPMI instance (0x3a1b0000, RST_LSIO_E_SPMI)
exposes a reset control to Linux. The CPM SPMI instance (0x053f1000,
connected to the MAX77779 PMIC) has its reset managed by CPM and has no
resets property, so probe() fails with -ENOENT there unless this is
optional.

2. Right now probe() fails if clk_get_rate() returns 0, yet
sdrv->clk_freq is never used for anything except a dev_dbg() print in
smartdv_spmi_pr_info(), while google_lga_spmi_cfg hardcodes
.prescaler = 4 below. That assumes i_clk is always 19.2 MHz (giving
2.4 MHz SCL), even though the LSIO_E SPMI instance is fed by a
CPM-managed clock (CLK_LSIO_E_SPMI) whose rate isn't hardcoded to
19.2 MHz. Wouldn't it be better to specify the target max bus frequency
(e.g. 2.4 MHz) in smartdv_spmi_config and compute prescaler from
clk_get_rate()? (Or if a fixed prescaler is really intended, please
don't fail probe() when clk_get_rate() returns 0.)

> +
> +static u32 smartdv_spmi_build_ctrl_reg(const struct smartdv_spmi_config *cfg)
> +{
> + return FIELD_PREP(SPMI_CONTROL_VERSION_MASK, cfg->spmi_version) |
> +       FIELD_PREP(SPMI_CONTROL_PRESCALER_MASK, cfg->prescaler);
> +}

In v1, DEFAULT_ARB_RETRY_LIMIT and DEFAULT_READ_LATENCY were both 32,
whereas v2 leaves SPMI_CONTROL_ARB_RETRY_LIMIT_MASK and
SPMI_CONTROL_RD_LATENCY_MASK as 0. Just want to double-check: is 0
intended for both fields on Tensor G5, or were those defaults dropped
accidentally when removing the v1 DT properties?

-Doug
