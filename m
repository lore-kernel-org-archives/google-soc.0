Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795607024;
	b=Nc2HlrA4fnnEjYcRpQvzMve8BKD20UFPPZIpWHTanddguMUfQ8Qp0Ynv7dvUqZ9dwHRP
	 ryvgiy6/sWvExhlUWIt65k5oItVSH6JKQTQAPW51J2Nl6Gmr8IGD0+Vz49P5D4PMonEpH
	 w5ZInPP4f/LxKzrtRsdcQ0vnvlF1FqSvW2fKH4nTNfctTKx+760AreNhSH53SvG9rLXnm
	 SdsgnkORyQMh7GlB5IKEMg3Hkl4b+pSad7fvGrrkuqt07IB8HScFKCq22HVGxYVPJgEyu
	 +P50BAmAzIEpOfG7I+mlFhEhA5etpb1FCXXJG6CRG/PusByZueHfnV2BbKJ7MLE3trQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795607024;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=orbQl2N4vlIOWiLrIf8SUWQ1uKxLJ8cjnJYad+kaD0M=;
	b=u9ZpCYrL6biphIcGv9FyeNG3StTO9gXdXCyPC+oLMTtGx5DPCb4N/PZz//DKg6G8uf9F
	 uzBdX1RflT5iLuLgXl5LSKa+WxpbNgJQ2/IkQzoBos3NN/bl32ln7NZ2RyzOAxUrpi4LD
	 yEE/VOQgDytO04RIMaibOfcK4Kw+z0/b/LFbc8aAJOfA3cy6wgY6aCkTJmsm1QmC2xZ3q
	 coKZxZ54YYpMfan3vGBNhl70aKln1WQT1Ed8REXuUDfhGyOYRFTzhSLIbvAVo+yUpOLEi
	 1Z7GGt5CUM5bcXTROJEPw5bLKXAm2SGuhuMvbSYsz38bm3x6ABkuIIsprFYhXTI6yWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=fggu0uJi;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63FEF606A33C
	for <google-soc@lists.linux.dev>; Wed, 25 Nov 2026 11:43:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63FEF606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=fggu0uJi
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso44685205e9.0
        for <google-soc@lists.linux.dev>; Wed, 25 Nov 2026 03:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795607023; x=1796211823; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=orbQl2N4vlIOWiLrIf8SUWQ1uKxLJ8cjnJYad+kaD0M=;
        b=fggu0uJiVxEX0JiGuzzu+zDn/cpp6y4NC0PLSmZZcRqeo+Nd70DBw0Z2s4rlXWAGzc
         rRq1ivZMfC0Be4ovD4c5sPDg+Z0HRER/lpGhQ5OselT07bhQ2piuR7bM8Cji+sjP2BRo
         u06iyHHeevJAIicB38gLiZ1UPa+jPUIIxBmMBp0iS6zWT+Zw1P8AjsnINpAHoVQKzf1K
         JjLD+rKevUfVpcGDzcud3yCh0R7xOSry34/Mf8HP5PDmhIC/JsVj+pFgaltJhKg0j2hb
         SC080jdmJTMjbTspt1+b8fmrFLvrSqMKwYcyWIxhsVolmEYDnqEOZWV9hmIVYsMePC6m
         n/Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795607023; x=1796211823;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=orbQl2N4vlIOWiLrIf8SUWQ1uKxLJ8cjnJYad+kaD0M=;
        b=OG+VaavluI7d7E70+clMO3UU7/ixRNJb47+yCtHUPhe1QVjGvDuldzkWbh8V0+IdGX
         MtE8t37tZcezyfGG0C8BrtG9PFmSZ+RCkDYygr8JlAzgvLq2/Z5q9hDrbH2ANeBf6NmI
         tzMrKnZy7G/9BdNh43vZOBOkhZstCBLiwKoctHkzqZEjD9Cphiu5HKA9vmqeliapL5VA
         emnJw9j4D6YQ08e6uodSKGJ2+Iyob2BXJfEmzUHfJFiNdus7n5rl46YqlnbpUVa7d4ZE
         lX3CrBuDl46G3XVieSNmjygyz7E/A/oUEtitdeIiz+dBwF7plrFwKmHSEsY6JZw2S3FO
         zjSw==
X-Forwarded-Encrypted: i=1; AL+hErEisekl9xXxNuyiRwtWrV6Pbj1XP0RLhXzNPUanHzVx2MFZ1Hgdxrzg0v6mkIRJdWe65OOrkTptDr3u@lists.linux.dev
X-Gm-Message-State: APuU4Z8cv65xUjTpFp15LC34/YA5a6mmQWk+uem7VBExgIqyv531a2cQ
	7znG6uUePJGs2UcFOkp5vrggzEBuwHVclbKwRMQ3EXIh7OGNLnrUzB2DWiApTEPeOis=
X-Gm-Gg: AZFdTZeP74yOUleYe1rD6NhjJzDGnRE/alEwViTza3zp4Tu+6XhsnRcKOQRP+uC+A4+
	fn41DqNHyH2EHNypXc6fcSRzqe7MxoJ47LEoaJ+UztMdFbnpvrzSTzYTCf3PQbAcSUX5rxxmj7x
	yawFediJukUPT9//EpewOyqgDMelC0iVg+Awa5SlOhtMS7y6Buh8EsAwQy1KvfE/sMS+PEj3YpS
	onc3vvXyiiHnNptbgkkky3D9flu7QbAqRD0MF2B1WBjki7ILrzMXfWDupyrWEHIuKwEmhHSGt/E
	UPfbnkCU2BsVUS1YfiWiSsWq7qT/xIHJEXmwNdcRwu5DXZ6vgceM18XFghRiA2ftfO+ckkUJsdN
	XJA2bqXMxsNFrOYw2IHCuoi0luWZlwWqcWFrmVFUaH92aQSRn4UyYUMVUa5zZHS3e2qSMfGjhxx
	RgN2VVZpeBuGZFZJYRP728aalghmHNAr8UgcUC+yvN/b6G/lM/hEYEKBEoue3RCG0le13bhuFmV
	h2SBJm20ovWPAIsjN9pk9JXSuXQkaN2539yGG7Pew9ojmCz95uUjOFSTTFQMrz1ejL3xAcEVTHw
	mdX8UH4lsxnt6RHQnlT8Cf2XR2fx6hxWY33vucsTPuS7Pa4hehHT7nVAAS30wIiJLy0YiDefNIa
	US2XsBv0R9RlWpBIu
X-Received: by 2002:a05:600c:4e0d:b0:4bb:69b2:d3b3 with SMTP id 5b1f17b1804b1-4bb8881eea5mr364570665e9.27.1795607022789;
        Wed, 25 Nov 2026 03:43:42 -0800 (PST)
Received: from localhost (p200300f65f19a9043ef7230869dfba63.dip0.t-ipconnect.de. [2003:f6:5f19:a904:3ef7:2308:69df:ba63])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bb884865a2sm527753115e9.3.2026.11.25.03.43.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:43:41 -0800 (PST)
Date: Wed, 25 Nov 2026 12:43:40 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Brian Norris <briannorris@chromium.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Thomas Gleixner <tglx@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	=?utf-8?B?QW5kcsOp?= Draszik <andre.draszik@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Radu Rendec <radu@rendec.net>, 
	Jakub =?utf-8?B?R8WCb3dhY2tp?= <jglow@google.com>, linux-clk@vger.kernel.org, 
	Douglas Anderson <dianders@chromium.org>, devicetree@vger.kernel.org, linux-pm@vger.kernel.org, 
	Mariano Marciello <mmarciello@google.com>, google-soc@lists.linux.dev
Subject: Re: [PATCH v2 5/9] reset: google: Add CPM reset driver
Message-ID: <awbJUwrBQw5TnowW@monoceros>
References: <20261125000349.3385325-1-briannorris@chromium.org>
 <20261124160343.v2.5.I0b1ad34a718a9b5f667d2481041970ea45989dd3@changeid>
 <f89e293688feb3f9bcdce0f1b6fed0ee424e5cd8.camel@pengutronix.de>
X-Mailing-List: google-soc@lists.linux.dev
List-Id: <google-soc.lists.linux.dev>
List-Post: <mailto:google-soc@lists.linux.dev>
List-Help: <mailto:google-soc+help@lists.linux.dev>
List-Subscribe: <mailto:google-soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:google-soc+unsubscribe@lists.linux.dev>
List-Owner: <mailto:google-soc+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="huwbq4lvetfh3uwf"
Content-Disposition: inline
In-Reply-To: <f89e293688feb3f9bcdce0f1b6fed0ee424e5cd8.camel@pengutronix.de>


--huwbq4lvetfh3uwf
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 5/9] reset: google: Add CPM reset driver
MIME-Version: 1.0

On Wed, Nov 25, 2026 at 09:48:04AM +0100, Philipp Zabel wrote:
> > +#include <linux/mod_devicetable.h>
>=20
> Please include the specific <linux/device-id/*.h> that is needed
> instead of all of <linux/mod_devicetable.h>.

Or better still, rely on the bus headers to provide the needed
*_device_id structures. (That is <linux/platform_device.h> provides
of_device_id (for patch #2) and <linux/auxiliary_bus.h> provides
auxiliary_device_id and of_device_id (for patches #3 - #6)).

Best regards
Uwe

--huwbq4lvetfh3uwf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmsGyeoACgkQj4D7WH0S
/k7XEggAlcj2TrM3p6EXOwI/xsUxWXF252CxwyEWI8ZmPEpI6bAu6Q2vo1jWzU80
RgNMuXczOoZoJ6+hJdkMeoqHuhp2FPvl718ZM9+ZXmIzmzCoBNWIn7I/StnNApVp
CRTaJoMc3RQ58/iAEYs4Bd6kNCpJoojOnWxMnprqZsXFWDmYDOaKauDIqnRyeGSd
Y/roBTL3HpvnWDZxm7b51fG8984ltXAM06Db+ZRdnLxyged3B5xdXwcFGLlqeoKG
ti6pQXYhQnxuxJFTg8v+DdOAKp8wPe6CkjTN92KfVvWDgxJYHe7zwZ1V0TrgDqMQ
p3mJ8Bmk3uxwBcQfM5lzAgDW6N8h4Q==
=fqd8
-----END PGP SIGNATURE-----

--huwbq4lvetfh3uwf--
