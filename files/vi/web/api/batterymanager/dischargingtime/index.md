---
title: "BatteryManager: thuộc tính dischargingTime"
short-title: dischargingTime
slug: Web/API/BatteryManager/dischargingTime
page-type: web-api-instance-property
browser-compat: api.BatteryManager.dischargingTime
---

{{ApiRef("Battery API")}}{{securecontext_header}}

Thuộc tính chỉ đọc **`dischargingTime`** của giao diện {{domxref("BatteryManager")}} cho biết lượng thời gian còn lại, tính bằng giây, cho đến khi pin xả hết hoàn toàn,
hoặc {{jsxref("Infinity")}} nếu pin hiện đang được sạc thay vì đang xả hoặc user agent không thể báo cáo thông tin trạng thái pin.
Khi giá trị của nó thay đổi, sự kiện {{domxref("BatteryManager/dischargingtimechange_event", "dischargingtimechange")}} sẽ được kích hoạt.

> [!NOTE]
> Ngay cả khi thời gian trả về chính xác đến từng giây, các trình duyệt vẫn làm tròn nó đến một khoảng lớn hơn
> (thường là 15 phút gần nhất) vì lý do quyền riêng tư.

## Giá trị

Một số.

## Ví dụ

### HTML

```html
<div id="dischargingTime">(discharging time unknown)</div>
```

### JavaScript

```js
navigator.getBattery().then((battery) => {
  const time = battery.dischargingTime;

  document.querySelector("#dischargingTime").textContent =
    `Remaining time to fully discharge the battery: ${time}s`;
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
