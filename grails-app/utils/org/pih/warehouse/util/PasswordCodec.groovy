/**
* Copyright (c) 2012 Partners In Health.  All rights reserved.
* The use and distribution terms for this software are covered by the
* Eclipse Public License 1.0 (http://opensource.org/licenses/eclipse-1.0.php)
* which can be found in the file epl-v10.html at the root of this distribution.
* By using this software in any fashion, you are agreeing to be bound by
* the terms of this license.
* You must not remove this notice, or any other, from this software.
**/ 
package org.pih.warehouse.util

import java.security.MessageDigest
import sun.misc.BASE64Encoder
import sun.misc.CharacterEncoder

class PasswordCodec {
	static encode = { String str -> 
		MessageDigest md = MessageDigest.getInstance('SHA') 
		md.update(str.getBytes('UTF-8')) 
		return (new BASE64Encoder()).encode(md.digest()) 
	}
}
