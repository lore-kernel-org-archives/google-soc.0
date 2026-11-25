Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795648350;
	b=QrzVbLBaxdd1AVTDnjvie+lvkm7PDdZT397MAE41TYX532nfZUi6sX+j69hQt/sK7YmI
	 guOtUdCn/Z+gueTY4WvQ2ajs2n4hKz+4rNrzOkAVkiwrqp09vO2HTUIfgKc0L6RKO99if
	 4nZxey+HJZ3DhyyBjfy47hrYq9Vy57zrKLSUe46u2qeEUPxTaYUvXW16fDu+BmLRHXd8M
	 nlSOBCsHz6UHTsWgU0SMM3zXHXgUGUiZLD30zxwo2ALLQB7bngQLaLDxfoqHBHH/1Kf9T
	 36qNTo8abyhX2j241EmZWS+zZp28w5avrtNyEjswMwfFXmcMq+RR43s+FkUg1YW6dcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795648350;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=r+DhYJ93tfesWORfibIV1d9I4czZkNjxK3eLYv410RY=;
	b=GC8fq8/6wAeUuHDxVNNw+UPGcTDsjcV0YTHifV28WbJ9NcCmEnpuOhudNORtNtbb+jTK
	 FImBHjDnAX5RPfdawPNswoDwx6qZQop/nP0so+fKkgn6Auxi8ltA6PpPG20AuqL1Qn5n6
	 ouMdufvx5w1dju1EMElwQLvuTtcZymBr0Kyv9zeXmcX2baRlnbsI7cnjaCAJ91CYRSzGn
	 Q5SPAQJpPbd8gxq+h39JQoYAMeAje6WiO9tMREPudMxW4G4fkQm1vFLqVEnpVqMCJ4QPk
	 HueMnl6oQKCiB1hiIQSf2LDOrN2hEQ9PypdO0mtzr7ToChH5rsIEdZJjMy63Q0ZIerw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=WJdRbc+6;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37D33606A684
	for <google-soc@lists.linux.dev>; Wed, 25 Nov 2026 23:12:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37D33606A684
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=WJdRbc+6
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4bb6886d30aso60659935e9.3
        for <google-soc@lists.linux.dev>; Wed, 25 Nov 2026 15:12:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795648347; x=1796253147; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=r+DhYJ93tfesWORfibIV1d9I4czZkNjxK3eLYv410RY=;
        b=WJdRbc+6EbwfrVj+AYrPmT812RVagBg0RmSAz9YBREsj0FIAZ5xkeEJVnMvm9lqIRl
         j+CPj01npWIChyjx8WSwcDuRDka9byLojDii9MOoqOkgxdC2eMQCEgnyUQICU+7oilIX
         hSeyHEP5AeJQ85G+iJqneXdztY93xxCDGZ2YIciyDQEDEIufxlJAIqWYwViiuNeHr3/l
         UvgLQJVjuqmyxQic/J2hMW5Zk2m+22fgliyHRL4ew0O7vpGW7yi7U2c6O5wD4kwtl0o2
         3Sg6Ob6PiS5Qxy9eqNIOGpjd+5cIRUR/MGhsoDN3rZxwkASOIs2MT/eIh8a93A8QyTAo
         QIug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795648347; x=1796253147;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r+DhYJ93tfesWORfibIV1d9I4czZkNjxK3eLYv410RY=;
        b=df4oZ1PlvOuTecpCZaMxKDJS/R5e+k4Jxhiu19fYVxBM4sAmkDE3lW896sU/IpD7C1
         OWD6V0PNyUH5yz+C3NCnSfQ3jBh8Y/JMhyf5fjYiodG0nBVPlwUrhLPNCfuWZ1uTQ199
         N8tUfG5WFMT/5MUEOkOZpPeRvZMXtkTkTEj/c97WtSP7iZp2UASmtWs/xReAVRVrT5t/
         a+htUAR1qh11D1M5H7fVDHdE533+UqQC/7lJSiEnDIJDipYIqVOJck4sjt86UY4+431v
         Eliry+M4Uv40PqBW2oyTzSGGdGmlUCH3PKHgyDHKQAjEge3rsWjHZh5vPhh0jEJ1BLpQ
         +JQw==
X-Forwarded-Encrypted: i=1; AL+hErHkCx2VX0Sli0dS8cjBg8jZQNZQDT91KSNjOvf9s04DsQqTvTs2+Atr3lPMyVEdibE9CjvPSTz8fVLs@lists.linux.dev
X-Gm-Message-State: APuU4Z8YAuJgamYIQgXxSu+kkOnjZam6vcj43v2tVK+aFLPadVOkgFnt
	KrEoBIwTnlbV+wY4STx1TseixM9g72H4zfKJlKQkY3qVg8VTvoeYL0Lf4lj7tjfU2H8=
X-Gm-Gg: AZFdTZeMjwOgM1KNG4fB0pDO6qDDt30EN/By2yb0ybDGbB+pcNVDZ10vY1t6ti/MFbE
	6ZloLzShr/LsGvuGRpT4Ylt9EjWK48kMgFXZMCSgwpRq9hEWy3ACUdb1lcO9vcbin92Gr6UTBkQ
	v7Mvp3pws8HZygl8L7OgAgJnmJYSQzty1n6OD7UKjVUTuZPDzqPL9ExPX65Dm0DQ1nIS1Ze3kKi
	ZZ04bnI08T12D0mdok+oNX+84+oXEPztFWyikCAIYr1BRqFI33+ueEoNCLHe/KHAN4QA0CQadwb
	LdUy+20FkIXbJV26CjF1uxnWm2KfD6AJ/VwGT/4+HqTvJzdKwb7tuyHB8VmH9qGZb8/fcyj3xLf
	WIkdPK1pWbZoc4ebWuHuwtuAfEzQo67f7hQnB6YDVt3MvccPJgTVidG1DjjcRTTIz5YvFwuAGWW
	3/xrVY9L3NZDHVTplgjLVlJnFwXFoEBkcD7groy6Lwl5mn+wrprvkaEK1fBekF2cN9aXlQIJ+PU
	lU05jkGmrGJK32C+mE84A/N390o8Uw9NqJXqdVO+5eH8MdPTs0mZ9kxUiExJGbmDIejCfRsMgz/
	PgEHacTCi2HWH4R80lwCP8knXHw05viaLas=
X-Received: by 2002:a05:600c:4f84:b0:4bb:8701:a2df with SMTP id 5b1f17b1804b1-4bb88809950mr395769935e9.17.1795648347566;
        Wed, 25 Nov 2026 15:12:27 -0800 (PST)
Received: from localhost ([2a02:8071:6e30:8500:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bb8533579csm480759855e9.2.2026.11.25.15.12.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 15:12:26 -0800 (PST)
Date: Thu, 26 Nov 2026 00:12:25 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Brian Norris <briannorris@chromium.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
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
Message-ID: <awdp3W7LWfQ3ZrIy@monoceros>
References: <20261125000349.3385325-1-briannorris@chromium.org>
 <20261124160343.v2.5.I0b1ad34a718a9b5f667d2481041970ea45989dd3@changeid>
 <f89e293688feb3f9bcdce0f1b6fed0ee424e5cd8.camel@pengutronix.de>
 <awbJUwrBQw5TnowW@monoceros>
 <awc0sBl6q6A2Reaq@google.com>
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
	protocol="application/pgp-signature"; boundary="khx4cneo7r6erf2z"
Content-Disposition: inline
In-Reply-To: <awc0sBl6q6A2Reaq@google.com>


--khx4cneo7r6erf2z
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 5/9] reset: google: Add CPM reset driver
MIME-Version: 1.0

On Wed, Nov 25, 2026 at 11:19:12AM -0800, Brian Norris wrote:
> On Wed, Nov 25, 2026 at 12:43:40PM +0100, Uwe Kleine-K=F6nig wrote:
> > On Wed, Nov 25, 2026 at 09:48:04AM +0100, Philipp Zabel wrote:
> > > > +#include <linux/mod_devicetable.h>
> > >=20
> > > Please include the specific <linux/device-id/*.h> that is needed
> > > instead of all of <linux/mod_devicetable.h>.
> >=20
> > Or better still, rely on the bus headers to provide the needed
> > *_device_id structures. (That is <linux/platform_device.h> provides
> > of_device_id (for patch #2)
>=20
> Only very indirectly:
>=20
>   <linux/platform_device.h>
>   -> <linux/device.h>
>     -> <linux/device/driver.h>
>       -> <linux/device-id/of.h>
>=20
> > and <linux/auxiliary_bus.h> provides
> > auxiliary_device_id and of_device_id (for patches #3 - #6)).
>=20
> Also quite indirectly.

Yes, I already thought about making this more explicit. But this isn't
my primary objective currently. It's safe to assume that the provider of
struct platform_driver also provides of_device_id. While a forward
declaration would be enough technically to define struct
platform_driver, that is not sensible because most users of
platform_driver also need the definition of of_device_id and there are
too many drivers relying on that already.

Well, but having said that, the thing that I consider important is that
no new users of <linux/mod_devicetable.h> pop up. If you want to go for
#including <linux/device-id/of.h> that's fine for me, too. (And similar
for the other busses and *_device_id structs).

Best regards
Uwe

--khx4cneo7r6erf2z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmsHa1YACgkQj4D7WH0S
/k62MQf+OKGka4mPSwopQ0+gI2VWXrdB3QhqgUL8ffjUMb7jkBi86oA6YfcjNC/D
8aZRTb/LZNPgl7ygdsKPEfFKlbKH1yCA+9gfN/aS+x6ykkZUKdn1Ha8m8ImuN87s
ooG++TXgzYfljHdoCVeukZsRth0gqt+QTBWLDPPUCDzC543cmPPqIWNi0LXdgwuf
OFve6MraHVKSLw0TVigzWyx0MYat5C1Y5gWVcsnmShhh1D18CrPfvFcu4dFot6Zj
IsEZRk30Wuu42YCnSD1t+UeGc+VDD5hxC1JhUdvN7txOJr1NHKdNT11aByux9mPD
ityFQTt/321OJci6adJV7NMgTYNlPg==
=MU9a
-----END PGP SIGNATURE-----

--khx4cneo7r6erf2z--
