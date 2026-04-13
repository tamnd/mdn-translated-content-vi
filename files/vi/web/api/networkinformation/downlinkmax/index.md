---
title: "NetworkInformation: thuộc tính downlinkMax"
short-title: downlinkMax
slug: Web/API/NetworkInformation/downlinkMax
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.NetworkInformation.downlinkMax
---

{{APIRef("Network Information API")}}{{SeeCompatTable}} {{AvailableInWorkers}}

Thuộc tính chỉ đọc **`downlinkMax`** của giao diện {{domxref("NetworkInformation")}} trả về tốc độ tải xuống tối đa, tính bằng megabit mỗi giây (Mbps), của công nghệ kết nối bên dưới.

## Giá trị

Một số đại diện cho tốc độ tải xuống tối đa, tính bằng megabit mỗi giây (Mb/s), của công nghệ kết nối bên dưới.

## Ví dụ

Ví dụ sau đây giám sát kết nối bằng sự kiện `change` và ghi lại các thay đổi khi chúng xảy ra.

```js
function logConnectionType() {
  let connectionType = "not supported";
  let downlinkMax = "not supported";

  if ("connection" in navigator) {
    connectionType = navigator.connection.effectiveType;

    if ("downlinkMax" in navigator.connection) {
      downlinkMax = navigator.connection.downlinkMax;
    }
  }

  console.log(
    `Current connection type: ${connectionType} (downlink max: ${downlinkMax})`,
  );
}

logConnectionType();
navigator.connection.addEventListener("change", logConnectionType);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
