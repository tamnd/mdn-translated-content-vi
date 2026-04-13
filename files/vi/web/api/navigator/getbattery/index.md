---
title: "Navigator: phương thức getBattery()"
short-title: getBattery()
slug: Web/API/Navigator/getBattery
page-type: web-api-instance-method
browser-compat: api.Navigator.getBattery
---

{{ApiRef("Battery API")}}{{securecontext_header}}

Phương thức **`getBattery()`** cung cấp thông tin về pin của hệ thống.
Nó trả về một lời hứa về pin, giải quyết bằng đối tượng {{domxref("BatteryManager")}} cung cấp một số thuộc tính để biết trạng thái pin, đồng thời một số sự kiện bạn có thể xử lý để theo dõi trạng thái pin.
Điều này thực hiện {{domxref("Battery Status API", "", "", "nocode")}}; hãy xem tài liệu đó để biết thêm chi tiết, hướng dẫn sử dụng API và mã mẫu.

Kể từ Chrome 103, phương thức `Navigator.getBattery()` của {{domxref("Battery Status API", "", "", "nocode")}} chỉ hiển thị trong bối cảnh bảo mật.

> [!LƯU Ý]
> Quyền truy cập vào tính năng này có thể được kiểm soát bởi chỉ thị {{HTTPHeader("Permissions-Policy")}} {{HTTPHeader("Permissions-Policy/battery", "battery")}}.

## Cú pháp

```js-nolint
getBattery()
```

### Thông số

Không có.

### Giá trị trả về

{{JSxRef("Promise")}} đáp ứng đối tượng {{DOMxRef("BatteryManager")}} mà bạn có thể sử dụng để nhận thông tin về trạng thái của pin.

### Ngoại lệ

- `NotAllowedError` {{domxref("DOMException")}}
  - : Việc sử dụng tính năng này đã bị [Permissions Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy) chặn.

- `SecurityError` {{domxref("DOMException")}}
  - : Tác nhân người dùng không tiết lộ thông tin về pin trong bối cảnh không an toàn và phương thức này được gọi từ bối cảnh không an toàn.

## Ví dụ

Ví dụ này tìm nạp trạng thái sạc hiện tại của pin và thiết lập trình xử lý cho sự kiện {{domxref("BatteryManager/chargingchange_event", "chargingchange")}} để trạng thái sạc được ghi lại bất cứ khi nào nó thay đổi.

```js
let batteryIsCharging = false;

navigator.getBattery().then((battery) => {
  batteryIsCharging = battery.charging;

  battery.addEventListener("chargingchange", () => {
    batteryIsCharging = battery.charging;
  });
});
```

Để biết thêm ví dụ và chi tiết, hãy xem {{domxref("Battery Status API", "", "", "nocode")}}.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Battery Status API", "", "", "nocode")}}
- Chỉ thị {{HTTPHeader("Permissions-Policy")}} {{HTTPHeader("Permissions-Policy/battery", "battery")}}
