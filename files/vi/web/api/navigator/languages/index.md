---
title: "Navigator: thuộc tính languages"
short-title: languages
slug: Web/API/Navigator/languages
page-type: web-api-instance-property
browser-compat: api.Navigator.languages
---

{{APIRef("HTML DOM")}}

Thuộc tính chỉ đọc **`languages`** của giao diện {{domxref("Navigator")}}
trả về một mảng các chuỗi đại diện cho sở thích của người dùng
ngôn ngữ. Ngôn ngữ được mô tả bằng {{glossary("BCP 47 language tag")}}. Trong sự trở lại
mảng chúng được sắp xếp theo sở thích với ngôn ngữ ưa thích nhất trước tiên.

Giá trị của {{domxref("Navigator.language","navigator.language")}} là
phần tử đầu tiên của mảng trả về.

Khi giá trị của nó thay đổi, do ngôn ngữ ưa thích của người dùng thay đổi.
Sự kiện {{domxref("Window.languagechange_event", "languagechange")}} được kích hoạt trên đối tượng {{domxref("Window")}}.

Tiêu đề HTTP {{HTTPHeader("Accept-Language")}} trong mọi yêu cầu HTTP từ trình duyệt của người dùng thường liệt kê các ngôn ngữ giống như thuộc tính `navigator.languages`, với giá trị `q` (giá trị chất lượng) giảm dần. Một số trình duyệt (Chrome và Safari) thêm thẻ dự phòng chỉ có ngôn ngữ trong `Accept-Language`—ví dụ: `en-US,en;q=0.9,zh-CN;q=0.8,zh;q=0.7` khi `navigator.languages` là `["en-US", "zh-CN"]`. Vì mục đích bảo mật (giảm {{Glossary("fingerprinting")}}), cả `Accept-Language` và `navigator.languages` có thể không bao gồm danh sách đầy đủ các tùy chọn của người dùng, chẳng hạn như trong Safari (luôn luôn) và chế độ ẩn danh của Chrome, trong đó chỉ có một ngôn ngữ được liệt kê.

## Giá trị

Một mảng các chuỗi.

## Ví dụ

### Liệt kê nội dung của navigator.lingu và navigator.lingu

```js
navigator.language; // "en-US"
navigator.languages; // ["en-US", "zh-CN", "ja-JP"]
```

### Sử dụng hàm tạo Intl để thực hiện định dạng theo ngôn ngữ cụ thể, có dự phòng

Mảng số nhận dạng ngôn ngữ có trong `navigator.languages` có thể được chuyển trực tiếp đến hàm tạo {{jsxref("Intl")}} để triển khai lựa chọn ngôn ngữ dự phòng dựa trên tùy chọn, trong đó mục nhập đầu tiên trong danh sách khớp với ngôn ngữ được `Intl` hỗ trợ được sử dụng:

```js
const date = new Date("2012-05-24");

const formattedDate = new Intl.DateTimeFormat(navigator.languages).format(date);
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("navigator.language")}}
- {{domxref("navigator")}}
- Sự kiện {{domxref("Window.languagechange_event", "languagechange")}}
- {{jsxref("Intl")}}
