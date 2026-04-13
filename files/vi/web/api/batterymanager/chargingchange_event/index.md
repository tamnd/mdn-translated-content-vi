---
title: "BatteryManager: sự kiện chargingchange"
short-title: chargingchange
slug: Web/API/BatteryManager/chargingchange_event
page-type: web-api-event
browser-compat: api.BatteryManager.chargingchange_event
---

{{ApiRef("Battery API")}}{{securecontext_header}}

Sự kiện **`chargingchange`** của giao diện {{domxref("BatteryManager")}} được kích hoạt khi thuộc tính {{domxref("BatteryManager.charging", "charging")}} của pin được cập nhật.

## Cú pháp

Dùng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt một thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("chargingchange", (event) => { })

onchargingchange = (event) => { }
```

## Kiểu sự kiện

Một {{domxref("Event")}} tổng quát.

## Ví dụ

### HTML

```html
<div id="level">(battery level unknown)</div>
<div id="chargingTime">(charging time unknown)</div>
```

### JavaScript

```js
navigator.getBattery().then((battery) => {
  battery.onchargingchange = () => {
    document.querySelector("#level").textContent = battery.level;
    document.querySelector("#chargingTime").textContent = battery.chargingTime;
  };
});
```

{{ EmbedLiveSample('Example', '100%', 40) }}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("BatteryManager")}}
- {{domxref("Navigator.getBattery()")}}
