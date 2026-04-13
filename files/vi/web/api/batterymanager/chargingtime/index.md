---
title: "BatteryManager: thuộc tính chargingTime"
short-title: chargingTime
slug: Web/API/BatteryManager/chargingTime
page-type: web-api-instance-property
browser-compat: api.BatteryManager.chargingTime
---

{{ApiRef("Battery API")}}{{securecontext_header}}

Thuộc tính chỉ đọc **`chargingTime`** của giao diện {{domxref("BatteryManager")}} cho biết lượng thời gian còn lại, tính bằng giây, cho đến khi pin được sạc đầy, hoặc `0` nếu pin đã được sạc đầy hoặc user agent không thể báo cáo thông tin trạng thái pin.
Nếu pin hiện đang xả thay vì sạc, giá trị của nó là {{jsxref("Infinity")}}.
Khi giá trị của nó thay đổi, sự kiện {{domxref("BatteryManager/chargingtimechange_event", "chargingtimechange")}} sẽ được kích hoạt.

> [!NOTE]
> Ngay cả khi thời gian trả về chính xác đến từng giây,
> các trình duyệt vẫn làm tròn nó đến một khoảng lớn hơn
> (thường là 15 phút gần nhất) vì lý do quyền riêng tư.

## Giá trị

Một số.

## Ví dụ

### HTML

```html
<div id="chargingTime">(charging time unknown)</div>
```

### JavaScript

```js
navigator.getBattery().then((battery) => {
  const time = battery.chargingTime;

  document.querySelector("#chargingTime").textContent =
    `Time to fully charge the battery: ${time}s`;
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
