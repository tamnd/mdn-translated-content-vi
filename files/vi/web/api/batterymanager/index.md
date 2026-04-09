---
title: BatteryManager
slug: Web/API/BatteryManager
page-type: web-api-interface
browser-compat: api.BatteryManager
---

{{ApiRef("Battery API")}}{{securecontext_header}}

Giao diện **`BatteryManager`** của {{domxref("Battery Status API", "", "", "nocode")}} cung cấp thông tin về mức sạc pin của hệ thống. Phương thức {{domxref("navigator.getBattery()")}} trả về một promise được giải quyết với một giao diện `BatteryManager`.

Kể từ Chrome 103, giao diện `BatteryManager` của {{domxref("Battery Status API", "", "", "nocode")}} chỉ được cung cấp trong ngữ cảnh bảo mật.

{{InheritanceDiagram}}

## Thuộc tính thể hiện

_Cũng kế thừa các thuộc tính từ giao diện cha của nó, {{domxref("EventTarget")}}._

- {{domxref("BatteryManager.charging")}} {{ReadOnlyInline}}
  - : Một giá trị Boolean cho biết pin hiện đang được sạc hay không.
- {{domxref("BatteryManager.chargingTime")}} {{ReadOnlyInline}}
  - : Một số biểu thị thời gian còn lại, tính bằng giây, cho đến khi pin được sạc đầy, hoặc `0` nếu pin đã được sạc đầy.
- {{domxref("BatteryManager.dischargingTime")}} {{ReadOnlyInline}}
  - : Một số biểu thị thời gian còn lại, tính bằng giây, cho đến khi pin cạn hoàn toàn và hệ thống bị tạm ngưng.
- {{domxref("BatteryManager.level")}} {{ReadOnlyInline}}
  - : Một số biểu thị mức sạc pin của hệ thống, được chuẩn hóa thành giá trị từ `0.0` đến `1.0`.

## Phương thức thể hiện

_Cũng kế thừa các phương thức từ giao diện cha của nó, {{domxref("EventTarget")}}._

## Sự kiện

_Cũng kế thừa các sự kiện từ giao diện cha của nó, {{domxref("EventTarget")}}._

- {{domxref("BatteryManager/chargingchange_event", "chargingchange")}}
  - : Được kích hoạt khi trạng thái sạc pin (thuộc tính {{domxref("BatteryManager.charging", "charging")}}) được cập nhật.
- {{domxref("BatteryManager/chargingtimechange_event", "chargingtimechange")}}
  - : Được kích hoạt khi thời gian sạc pin (thuộc tính {{domxref("BatteryManager.chargingTime", "chargingTime")}}) được cập nhật.
- {{domxref("BatteryManager/dischargingtimechange_event", "dischargingtimechange")}}
  - : Được kích hoạt khi thời gian xả pin (thuộc tính {{domxref("BatteryManager.dischargingTime", "dischargingTime")}}) được cập nhật.
- {{domxref("BatteryManager/levelchange_event", "levelchange")}}
  - : Được kích hoạt khi mức pin (thuộc tính {{domxref("BatteryManager.level", "level")}}) được cập nhật.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Battery Status API", "", "", "nocode")}}
- {{domxref("Navigator.getBattery()")}}
