---
title: "BatteryManager: thuộc tính level"
short-title: level
slug: Web/API/BatteryManager/level
page-type: web-api-instance-property
browser-compat: api.BatteryManager.level
---

{{ApiRef("Battery API")}}{{securecontext_header}}

Thuộc tính chỉ đọc **`level`** của giao diện {{domxref("BatteryManager")}} cho biết mức sạc pin hiện tại dưới dạng một giá trị từ `0.0` đến `1.0`.
Giá trị `0.0` có nghĩa là pin đã cạn và hệ thống sắp bị tạm ngưng.
Giá trị `1.0` có nghĩa là pin đã đầy hoặc user agent không thể báo cáo thông tin trạng thái pin.
Khi giá trị của nó thay đổi, sự kiện {{domxref("BatteryManager/levelchange_event", "levelchange")}} sẽ được kích hoạt.

## Giá trị

Một số.

## Ví dụ

### Lấy mức pin

#### HTML

```html
<button id="get-level">Get battery level</button>
<div id="output"></div>
```

#### JavaScript

```js
const getLevel = document.querySelector("#get-level");
const output = document.querySelector("#output");

getLevel.addEventListener("click", async () => {
  if (!navigator.getBattery) {
    output.textContent = "Battery manager is unsupported";
  } else {
    const manager = await navigator.getBattery();
    const level = manager.level;
    output.textContent = `Battery level: ${level}`;
  }
});
```

#### Kết quả

{{ EmbedLiveSample('Getting the battery level') }}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("BatteryManager")}}
- {{domxref("Navigator.getBattery()")}}
