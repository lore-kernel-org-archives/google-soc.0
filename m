Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795217321;
	b=QcO4GzX5ZJY+VH6Tsz5jqO0GUBgA25DIHR1i7dMoWLOLq2AQhPtc/8prvOUR1FDNmtTD
	 7FzWshfb59VHFIpKfK6hlncq/dClUGOCqx+YjiNyGViJZNYdLgLrNQPLiPMJVIH+7OSF9
	 gvTcEh1dK6j4uTjbuk+QEth8wzROLbQd069YHZy1mWZPc5yhYEgmQiCP/YR7CdXmNvRue
	 Rg5sTM05L24dnTe6W1IokkNpQskAygrmt2X8uLowtBiX6FO0dMt7tEWLh1bGOlD3C66EQ
	 v7EvhFeekf5s18eEb1/kLfk9gtDerlW5s0qg7ZFYVmQhfcXwCOeLV7NLKFmhTxYRqww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795217321;
	h=Received:DKIM-Signature:Date:From:To:Subject:Message-ID:MIME-Version:
	 Content-Type:Content-Disposition;
	bh=PHRVX3HoZ5hJMO6ZG1kGzF+WUZ29qYjzDXgYhpsrpHI=;
	b=D6axbkGDBNR28Vaz0ddexMahk2jejWChhhVvL5Fi7CV1I+2iIEa/X28CisbrzkF8J0YU
	 NI/l8zaDA+5i44N1zHICozrgE3QbGl/NQfyX20v+UYXZRD8aBdvT1xDsYkBFuCYESTzD+
	 yCrI9rQ+E8BghGGUUjeJsx9uYp0Fb8QWqC3+/fpapZpdbroSF1+zTsrEUkeZIgEQW5ECE
	 KN/WI4v+PIO4ycDjqxk/tToRw6W41tPMfVShVJN7Qn6FqZIVtfeJc3Zouirb626PhNxtg
	 QEoNpxAdUINLItlxGs9gDYSY9yuwdl31TffCJA7JG0wc5Fo7LZqbzd/B9VqNTQgX/gA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SQ4QF6Ol;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DE7C606A6A7
	for <google-soc@lists.linux.dev>; Fri, 20 Nov 2026 23:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SQ4QF6Ol
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 619A21F000C0;
	Fri, 20 Nov 2026 23:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795217320;
	bh=PHRVX3HoZ5hJMO6ZG1kGzF+WUZ29qYjzDXgYhpsrpHI=;
	h=Date:From:To:Subject;
	b=SQ4QF6OlTeCVci6ZJIDt7UFcPUPXT/OCNrAsEYVF4VFWaTD44M4NAfQJzYGRM06iO
	 W4LSxayZ/U0diD2mefu3WwO93K3y69DX9+w1EJ2ba5PMSly5nGpQI4HEd/NclWeLIT
	 m5MEwpYld/NEkCSMLU9kC/0qRs4ipa7V5xVY3yONt2o3I1aq+IUednuvEa4k7c70Jk
	 3nvPEjvqt8tvQzJGHJVnaiaNkorqkHQgO2Hwjn5qg0VTr8xd0xNzb1kTFzZ8V+XzWL
	 WIaz1c7rpWDnmtI3Smq0vjA2l0WTyuWsEp+1Js4WWRMAZjVfdELaCaOU9MPF3fSjEG
	 3Zmg6Lw9T9a3A==
Date: Fri, 20 Nov 2026 23:28:39 +0000
From: Konstantin Ryabitsev <mricon@kernel.org>
To: google-soc@lists.linux.dev
Subject: Test delivery and archive initialization
Message-ID: <20261120-poetic-steadfast-fox-f8d1bd@toolbx>
X-Mailing-List: google-soc@lists.linux.dev
List-Id: <google-soc.lists.linux.dev>
List-Post: <mailto:google-soc@lists.linux.dev>
List-Help: <mailto:google-soc+help@lists.linux.dev>
List-Subscribe: <mailto:google-soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:google-soc+unsubscribe@lists.linux.dev>
List-Owner: <mailto:google-soc+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello:

This is a test message to verify delivery to the new google-soc list and
to initialize its archive on lore.kernel.org. No reply is needed.

-K
