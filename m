Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795634356;
	b=P4GqPpjJV5d1t38txHZS/sWTY10+xgIKJV+GmjgwFzBONAm4W+fMbb3G7L8wY3ZqUAof
	 60tIxJpP0hK/qHkhmIInTnIYQQ/xSjk9pO/meagPSqPJ4/s58eS4BlSrRGPkSWqlL71vD
	 dheB7yA6j5VH6UHeABleYbdyT8hHCODshNnjG7H96iMF5JmFJYuy8d+Yfe0oXTzy+6a0x
	 LNIO7fSehC0y0udW8GXsSFU4Q/kHP90/186cOMrIpPtwSH9L/rAyr4tjwBMUHRSy+L/gu
	 6bl31D25o7v9opD6hvYV+Gm5i0Vr82eTUXiOeJ2CH012vIO1gDeHiZrVIHF2FVqPa8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795634356;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=CDQbjZRD5r2LD7/4BjsL2T12qmTPHlWO1n2mr1qyPAs=;
	b=cWa/rEJP9IUJwJZBL43U/ImOlkWtydS5JXDzHVQEDlSo/VBLcBbbOlx8QTd4ZksTCUWk
	 4zEW8TXX3wNG06GvMX28Slkv5Kc7CCIwxyEmhv7yfjEY4oSTEmJqHvn7W+0su769m46Rq
	 m4phUYl65DiZUTpQVtgd6Q1S5B+6uADOg20kpJACwO1i5u7WoBj+k43UZ4nMjcLbdIRLB
	 9g9rmKzVa4uMnXBGWoPBsaqmXhlmSKIKHPlG3CORtyPLrwdaXiee8Tj5WXTEqqrXQHduU
	 S17Ko1p7nXefCGdAQIVbjiFCm5862RW1Nl0jsS8u7e2tYy42VoGrqHq129QoWiF8SoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b="Si/IdT/E";
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9BCB606A326
	for <google-soc@lists.linux.dev>; Wed, 25 Nov 2026 19:19:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9BCB606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Si/IdT/E
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2f0213202fdso33236005ad.3
        for <google-soc@lists.linux.dev>; Wed, 25 Nov 2026 11:19:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795634355; x=1796239155; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CDQbjZRD5r2LD7/4BjsL2T12qmTPHlWO1n2mr1qyPAs=;
        b=Si/IdT/EACld+u250pujPNFIJr+PN9PvWweCjko7pZiYDxZOxctfKNJYADIs+Mwqvz
         TdlVlpoH3acC4lwF3xwCBquZVmMrDu0KtnIPsLbYx8dFXo76B8QGl6CFyhRnVOMwZa3s
         OdOwE0oNEJwrh7416uCwOOgZ6lxI5xXSrv8WQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795634355; x=1796239155;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=CDQbjZRD5r2LD7/4BjsL2T12qmTPHlWO1n2mr1qyPAs=;
        b=ECnlFHfu9DZZiMltoz4b00RsTdH5uGnAsuudhs9980qZByu2nEZ20/3qVjO4VYv09D
         3Jf0gaiDe7NiINw9Fgpo4bg8CJ+JGo+ZVrxppAQIzgokUWIdxesV8XQ0QEnJQRDpyvEe
         eo7FYP9o16nwUTprit86dslaOwFEEnk72GvIhxkQZRx3XLpMF4vCgBybbTblIVHHYemo
         GEsREo8LdFuiG2N5KPEPQXzCBo7ZaHf6KVKwhhI1T/FKc4Pg6EI16HsNUB1xoGYRhMAB
         E0POGq9cck/U0VtEzxJppyBgu3szpWJy3mJ6hzD/ohmMm4Tygb6TnM8TkhBZQ8RiIGq+
         YpnA==
X-Forwarded-Encrypted: i=1; AL+hErEnni2Db7Ne/1WCVDCx7uCndmwwSJLUYByxywsn4jyZB28V0MO7y8fMGZMG/I9noMKDPSpigbXoAbxA@lists.linux.dev
X-Gm-Message-State: APuU4Z/Q06ZfbHgpq1F6+dNFR8zgzoftXkYRoKy102BXypMj00Kne27y
	pGMAyi9CGMwzj3kONLYy/e0GXyoTPzjK+2WD3C++wgk/CRSa7BBoRh2P3SEAxAvDrA==
X-Gm-Gg: AZFdTZdfmzM1nXwfczGpwh8icj/AqlU637BYaBdJpbDn0hDmkVasfbKRJj9YW9QXjR9
	kyyJp5FACZtTF+MlvSbYWKjQoEG5UhWxdxtAiRMwLi/zlPqapN9gduDSlpL3vdFEDnqxyXpWXJI
	Lh6f3As1lFwTerSjm04GNZXmNKP2+orPryxzDNXJpaIeoTfkLJoxxWwPKT/gB7nBJ8esJ0Mn6jF
	oWpJy8RhuJ9GN/wqKoiM4WStRA4nr0lWZz5SHeBQ8XM1X2Zzh2CQeSXDL8NqxZFQciM7loBjAsQ
	9VbBNAuGBHzTGQP4VFgg8DkteSmr63RHGGxYvUPJJMbXOVxwNFBMCaU2V2YRouaqXyP6gFo9onC
	QnqBmxVU3+5MRwJ3KexfInQShvyxO2ogCpG+mA6MAUyhiQeEWYeUfjlnVNmPr2XY9kEYKuaTpKY
	z5M6JfarNVHtfVwYnU4e+wD+5otpdvkx2omf4foD9KVEC7LtV1/+pIpnDqYMT+vOGo6cNf1jsvh
	hQvP56W9BA/cLBcgOzE+CTYzkIU9Urn3ttkhS3U9vFaTRfbGWBLKH/CAWXrqSwOLW4OexpF/ily
	HCXbxahpsrfdm6fkbScMEtO16YvTJ3WjlxzfSk7stZeYct37sdiwZ4Cq0juLelcDQm4=
X-Received: by 2002:a17:902:d511:b0:2f0:446d:30cd with SMTP id d9443c01a7336-2f0446d33f4mr180619865ad.31.1795634355343;
        Wed, 25 Nov 2026 11:19:15 -0800 (PST)
Received: from localhost ([2a00:79e0:2e7c:8:d0a2:f616:6ba:a1ce])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-2f03ee84364sm93389045ad.5.2026.11.25.11.19.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 11:19:14 -0800 (PST)
Date: Wed, 25 Nov 2026 11:19:12 -0800
From: Brian Norris <briannorris@chromium.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Thomas Gleixner <tglx@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Radu Rendec <radu@rendec.net>,
	Jakub =?utf-8?B?R8WCb3dhY2tp?= <jglow@google.com>,
	linux-clk@vger.kernel.org, Douglas Anderson <dianders@chromium.org>,
	devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
	Mariano Marciello <mmarciello@google.com>,
	google-soc@lists.linux.dev
Subject: Re: [PATCH v2 5/9] reset: google: Add CPM reset driver
Message-ID: <awc0sBl6q6A2Reaq@google.com>
References: <20261125000349.3385325-1-briannorris@chromium.org>
 <20261124160343.v2.5.I0b1ad34a718a9b5f667d2481041970ea45989dd3@changeid>
 <f89e293688feb3f9bcdce0f1b6fed0ee424e5cd8.camel@pengutronix.de>
 <awbJUwrBQw5TnowW@monoceros>
X-Mailing-List: google-soc@lists.linux.dev
List-Id: <google-soc.lists.linux.dev>
List-Post: <mailto:google-soc@lists.linux.dev>
List-Help: <mailto:google-soc+help@lists.linux.dev>
List-Subscribe: <mailto:google-soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:google-soc+unsubscribe@lists.linux.dev>
List-Owner: <mailto:google-soc+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <awbJUwrBQw5TnowW@monoceros>

On Wed, Nov 25, 2026 at 12:43:40PM +0100, Uwe Kleine-König wrote:
> On Wed, Nov 25, 2026 at 09:48:04AM +0100, Philipp Zabel wrote:
> > > +#include <linux/mod_devicetable.h>
> > 
> > Please include the specific <linux/device-id/*.h> that is needed
> > instead of all of <linux/mod_devicetable.h>.
> 
> Or better still, rely on the bus headers to provide the needed
> *_device_id structures. (That is <linux/platform_device.h> provides
> of_device_id (for patch #2)

Only very indirectly:

  <linux/platform_device.h>
  -> <linux/device.h>
    -> <linux/device/driver.h>
      -> <linux/device-id/of.h>

> and <linux/auxiliary_bus.h> provides
> auxiliary_device_id and of_device_id (for patches #3 - #6)).

Also quite indirectly.

I'm not sure how to take this advice. I tend to see "include what you
use" feedback (and not rely on implicit includes) elsewhere, which
suggests I should *not* do what you say here. Do I just need to guess at
when an implicit include should be deemed intentional?

At the moment, I plan to simply go with Philipp's advice, as I don't see
the harm in targeted, explicit #include.

Regards,
Brian
