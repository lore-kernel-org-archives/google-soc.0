Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795638379;
	b=c0FU8jj4kqjvqSAl9JfvBRdCCC+J51gm5AwtVp1btH25iX6SD2AJniPXChgp8mdhotOM
	 KquFGDK9N4N8tubHkhaZau4BkUg6r+iW4oU6V0p7W/8iZYYtxAHmCj1fJCJUUte5KssmT
	 M2SmQytgvECRqsUHKz1SJ9RVJuv/lmrdi6je9SFewoUl9nXrlpDmfVxHcM+3PSr5XgjQc
	 ClfEF6QFzm0X7PWMLhfLHPba402mItpvMAAEQJTqBvZbjtGm2QOOaFE3Q+RokATRT/yXg
	 IoDZQ9JY5/3yEvEw9m8pu2o1n916KYMl278c8TZ9imd5zDNYnrS7Yy3ZGbLPwbgo1Ow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795638379;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=mcrqEIFHLvK+/DOQFdnjy8iLkd+vCgdIQ6/JpqUs2/I=;
	b=wFzzXjOCzt1XmD6WoVbqReyE7BSEv0MYlQS+NygC4MuEtBpWIBrZ6w2pzxajUiickodK
	 w9lmXqRWGUCB7wVuRdAO+yP9/kYRa6iG/ePYC7KdhyniQHgyXMX7uVtiAVH1FtewS/lmA
	 FOAj4cJvrq+wi7qAlwj2zx2AuvmlF/ldPy1oivor52XBoPhzNT9vnJEfU5SjuMwsr4tbe
	 kb5p3o9zz4u26588zLPQ3tcEFOxLeW+PzNsKtad8D6EqhclCSLw64BeGouQt/nsjBMxOK
	 ZC5X7f4BySFovWqA9t8k6TuP/SG/dA/lcrKK6YY50vvdilJOBaofip6SvsY3YQOJbXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ZUFwB0t1;
	arc=none smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8552606A32A
	for <google-soc@lists.linux.dev>; Wed, 25 Nov 2026 20:26:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8552606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ZUFwB0t1
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6ba12b00c76so6596847a12.0
        for <google-soc@lists.linux.dev>; Wed, 25 Nov 2026 12:26:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795638377; x=1796243177; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mcrqEIFHLvK+/DOQFdnjy8iLkd+vCgdIQ6/JpqUs2/I=;
        b=ZUFwB0t1Q6WjXhI+qO+iCSkrJihI0Xc+H29QqhzjkoKpXgBpK3rlsTAFHDkSyP177j
         Ui3w4Vh+tV9xH+aRk44VKlqS2fTQOL9jYgyE57OpFjepmGERUN9UmaXOQVV7mT+3LG9W
         yavpu0suNeOBMKCJGEQuIJKq1XZ1zbjLbpBY8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795638377; x=1796243177;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mcrqEIFHLvK+/DOQFdnjy8iLkd+vCgdIQ6/JpqUs2/I=;
        b=cXh5d761w4zL4aW62rwDTEZaVxQUD7uvyXNJOJr5Dzc7OAj1WrBx39nRGag4JMS5Zl
         lzDFMEXfW0M9jL90hfp86KJ7nDSWCOv3RjWNXF8Vl5TmaEJ3KaP2+rybicapccbrq6/1
         cd7ULF35GKgXHYuSVjBXlFAtJPA0B0bAgT48L8lCDrN2rB/uBwS82W6ws87hzDzERuzL
         f7rITsfhJUFPOzjvFqqyaEJlJwckd3NtsZFBzLlzjMZ7y0QO7LiSqr61/RNIrA8IHGrq
         lbEKbKCcocTRo182C8QD08SCbiTSMwUsdZ2Yj5RJLqz6CUFwMxLJAJuNutGPl06ewFU+
         ItkA==
X-Forwarded-Encrypted: i=1; AL+hErEYTu/BfD/69NqZC2+nTGFNdSzahby2Ok0LBF/wZZtY+K0bVgA8WCbh0otVee7/RW2DyBuvkc2tJsR6@lists.linux.dev
X-Gm-Message-State: APuU4Z8mfuw9ZUNRRhs3PPDkvhWei7JGwdrR1BOty7X5P00D9w9kqvch
	pPKzYXHJ+BWeasHeou86iQFgZ+HeqnBxDse4jBHJwpH5FmeN3WPPvFa5Mxq/Y7OtvJBWmOAkW24
	e1mOYa4ay
X-Gm-Gg: AZFdTZcvCKU2Ko5e4EHZvLw1b/22MxKKGVzGlz74sgrUhX+L7/dedfwb2rBddulhiJH
	SCc39EI0MeMErIx2wiDuRPeQzH6i6y6/eib8kAM0xd2F0y8eE3J7MIvs3t38hrxwFhxQ7l6AQqw
	W16zIAx7FPaty9YKJP9PUBi12kpFFn2zGVuhF3xMYrfieNuTxG0H9ks9KMUTfLWDXqffijhDoer
	/L2hYGrc5vfJqZYkzcwpV171AASfghznBxAg4UM22HwPNnakfPMrc807SkgAMoa5ZGdXmDTko2Y
	4ialkWIhqLdddxCwxQ2c0lufeyGo+0fpwbu3HJVhpC/OyW1HGiBb0K34d0a0LABwOk3kqw7WbY+
	t9Hbszk2R9i+2JjGIq6oRhsaS+dpPzGrbZGmzTC6AIU4JxfFASfAwjVN/pXGAqqVoIXrGueoCnd
	0/28nTz8kFvUV0uQGQDpDLB3LbPWigVaQa6UvqPCJRpv5dDiAtjMdCSIjW1pSMxoYNcy6vYRe6L
	dRzahNZ2bNZPmP/CoId9WJ4WcJCUKToH+p42kFPJCW1IbgyjI2fx7d7JlCQrFy3NDX2RWtOx2Ey
	uDB81kl5ToyFQSIsaD5t+vzVIaEDHhkjeAVHwbJt7MJ7ZfelepgbOoxJsYPSfTVt1C9z
X-Received: by 2002:a05:6402:3645:b0:6b8:7ec0:7506 with SMTP id 4fb4d7f45d1cf-6ba37e95796mr12905667a12.25.1795638377416;
        Wed, 25 Nov 2026 12:26:17 -0800 (PST)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com. [209.85.128.48])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba854bed08sm6834037a12.30.2026.11.25.12.26.14
        for <google-soc@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 12:26:16 -0800 (PST)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4bb85e07aadso77494135e9.1
        for <google-soc@lists.linux.dev>; Wed, 25 Nov 2026 12:26:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErG5QqrthTsmTyGdgdXnzb8gldnZXIyHsoL1kPdQjLE/wnuEQSWyogYbkNszR5EnLF7pgtseLHrpWa7E@lists.linux.dev
X-Received: by 2002:a05:600c:a4b:b0:4a1:dade:f049 with SMTP id
 5b1f17b1804b1-4bb88806292mr393435495e9.15.1795638373083; Wed, 25 Nov 2026
 12:26:13 -0800 (PST)
X-Mailing-List: google-soc@lists.linux.dev
List-Id: <google-soc.lists.linux.dev>
List-Post: <mailto:google-soc@lists.linux.dev>
List-Help: <mailto:google-soc+help@lists.linux.dev>
List-Subscribe: <mailto:google-soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:google-soc+unsubscribe@lists.linux.dev>
List-Owner: <mailto:google-soc+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261115180147.1208082-1-vamshigajjela@google.com> <20261115180147.1208082-2-vamshigajjela@google.com>
In-Reply-To: <20261115180147.1208082-2-vamshigajjela@google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 25 Nov 2026 12:26:01 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VLjPe1U_6LOtxZO=Zkc0sRHH+28PgYVqyCGckEJ=nAtQ@mail.gmail.com>
X-Gm-Features: Aa3M54oEC-In_bkVrLr1h65W2jhYWlRAtlpUDztwO3IbOK5jMmWhEITpomu3qyE
Message-ID: <CAD=FV=VLjPe1U_6LOtxZO=Zkc0sRHH+28PgYVqyCGckEJ=nAtQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: spmi: Add Google LGA SPMI controller
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
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun, Nov 15, 2026 at 10:02=E2=80=AFAM vamshi gajjela
<vamshigajjela@google.com> wrote:
>
> +allOf:
> +  - $ref: spmi.yaml#
> +
> +properties:
> +  compatible:
> +    const: google,lga-spmi
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - resets
> +
> +unevaluatedProperties: false

Looking at downstream usage, we may also want to add:

power-domains:
  maxItems: 1

Since at least some instances of this IP are power-gated by a domain.

We probably also want to add:

interrupts:
  maxItems: 1:

Even though the driver can work with polling (and I guess that's what
you do now), the interrupt should be wired up and the DT should
describe the hardware.

Neither of the two should be listed in "required".


> +examples:
> +  - |
> +    #include <dt-bindings/spmi/spmi.h>
> +
> +    spmi@14853000 {
> +        compatible =3D "google,lga-spmi";
> +        reg =3D <0x14853000 0x100>;

Should the example address match an actual instance of the SPMI on
lga? From what I see, it could be:

reg =3D <0x3a1b0000 0x200>

...you'd want to update the unit address on the node name too, then.


> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -25243,6 +25243,12 @@ T:     git https://github.com/cschaufler/smack-n=
ext.git
>  F:     Documentation/admin-guide/LSM/Smack.rst
>  F:     security/smack/
>
> +SMARTDV SPMI CONTROLLER DRIVER
> +M:     Vamshi Gajjela <vamshigajjela@google.com>
> +L:     linux-kernel@vger.kernel.org
> +S:     Maintained
> +F:     Documentation/devicetree/bindings/spmi/google,lga-spmi.yaml

Instead of a separate maintainer entry, maybe just add this under
"GOOGLE TENSOR SoC SUPPORT" ?
