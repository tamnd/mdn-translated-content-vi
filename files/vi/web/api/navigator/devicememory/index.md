---
title: "Navigator: thuộc tính deviceMemory"
short-title: deviceMemory
slug: Web/API/Navigator/deviceMemory
page-type: web-api-instance-property
browser-compat: api.Navigator.deviceMemory
---

{{APIRef("Device Memory API")}}{{securecontext_header}}

Thuộc tính chỉ đọc **`deviceMemory`** của giao diện {{domxref("Navigator")}} trả về dung lượng bộ nhớ thiết bị gần đúng tính bằng gigabyte.

Giá trị được báo cáo là không chính xác để cắt giảm {{glossary("fingerprinting")}}.
Nó được tính gần đúng bằng cách làm tròn bộ nhớ thực tế lên lũy thừa gần nhất là 2, sau đó chia số đó cho 1024.
Sau đó, nó được giới hạn trong giới hạn dưới và trên để bảo vệ quyền riêng tư của chủ sở hữu các thiết bị có bộ nhớ rất thấp hoặc bộ nhớ cao.
Các giới hạn này có thể thay đổi theo thời gian (xem [browser compatibility table](#browser_compatibility)).

## Giá trị

Một số dấu phẩy động được làm thô thành lũy thừa của hai giá trị, được giới hạn ở các giới hạn do thực hiện xác định.

Ví dụ: nếu trình duyệt không báo cáo dưới `2` hoặc cao hơn `32` thì giá trị là một trong: `2`, `4`, `8`, `16`, `32`.

## Ví dụ

```js
const memory = navigator.deviceMemory;
console.log(`This device approximately ${memory}GiB of RAM.`);
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- Tiêu đề HTTP {{HTTPHeader("Sec-CH-Device-Memory")}}
