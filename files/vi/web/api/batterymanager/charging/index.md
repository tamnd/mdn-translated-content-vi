---
title: "BatteryManager: thuộc tính charging"
short-title: charging
slug: Web/API/BatteryManager/charging
page-type: web-api-instance-property
browser-compat: api.BatteryManager.charging
---

{{ApiRef("Battery API")}}{{securecontext_header}}

Thuộc tính chỉ đọc **`charging`** của giao diện {{domxref("BatteryManager")}} là một giá trị Boolean cho biết pin của thiết bị hiện có đang được sạc hay không. Khi giá trị của nó thay đổi, sự kiện {{domxref("BatteryManager/chargingchange_event", "chargingchange")}} sẽ được kích hoạt.

Nếu pin đang được sạc hoặc user agent không thể báo cáo thông tin trạng thái pin, giá trị này là `true`. Ngược lại, nó là `false`.

## Giá trị

Một boolean.

## Ví dụ

### HTML

```html
<div id="charging">(charging state unknown)</div>
```

### JavaScript

```js
navigator.getBattery().then((battery) => {
  const charging = battery.charging;

  document.querySelector("#charging").textContent = charging;
});
```

{{ EmbedLiveSample('Examples', '100%', 30) }}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("BatteryManager")}}
- {{domxref("Navigator.getBattery()")}}
