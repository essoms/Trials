/**
* Copyright (c) 2012 Partners In Health.  All rights reserved.
* The use and distribution terms for this software are covered by the
* Eclipse Public License 1.0 (http://opensource.org/licenses/eclipse-1.0.php)
* which can be found in the file epl-v10.html at the root of this distribution.
* By using this software in any fashion, you are agreeing to be bound by
* the terms of this license.
* You must not remove this notice, or any other, from this software.
**/ 
package org.pih.warehouse.inventory

import org.pih.warehouse.core.Location
import org.pih.warehouse.shipping.ShipmentStatusCode;

public enum InventoryStatus {

	SUPPORTED(1),
	SUPPORTED_NON_INVENTORY(2),
	NOT_SUPPORTED(3)
	
	int sortOrder

	InventoryStatus(int sortOrder) { [ this.sortOrder = sortOrder ] }
	
	static int compare(InventoryStatus a, InventoryStatus b) {
		return a.sortOrder <=> b.sortOrder
	}
	
	static list() {
		[ SUPPORTED, SUPPORTED_NON_INVENTORY, NOT_SUPPORTED ]
	}
	
	String toString() { return name() }

}
