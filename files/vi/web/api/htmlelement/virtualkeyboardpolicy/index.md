---
title: "HTMLElement: thuộc tính virtualKeyboardPolicy"
short-title: virtualKeyboardPolicy
slug: Web/API/HTMLElement/virtualKeyboardPolicy
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.HTMLElement.virtualKeyboardPolicy
---

{{APIRef("VirtualKeyboard API")}}{{SeeCompatTable}}

Thuộc tính **`virtualKeyboardPolicy`** của giao diện {{domxref("HTMLElement")}} lấy và đặt một chuỗi cho biết hành vi bàn phím ảo trên màn hình trên các thiết bị như máy tính bảng, điện thoại di động hoặc các thiết bị khác khi bàn phím phần cứng có thể không có sẵn, nếu nội dung phần tử có thể chỉnh sửa (ví dụ: đó là phần tử {{htmlelement("input")}} hoặc {{htmlelement("textarea")}}, hoặc phần tử có thuộc tính [`contenteditable`](/en-US/docs/Web/HTML/Reference/Global_attributes/contenteditable) được đặt).

Nó phản ánh giá trị của thuộc tính HTML toàn cục [`virtualkeyboardpolicy`](/en-US/docs/Web/HTML/Reference/Global_attributes/virtualkeyboardpolicy).

## Giá trị

Một giá trị liệt kê; các giá trị có thể là:

- `"auto"` hoặc chuỗi rỗng (`""`)
  - : Trình duyệt tự động hiển thị bàn phím ảo khi người dùng chạm hoặc tiêu điểm vào phần tử.
- `"manual"`
  - : Trình duyệt không tự động hiển thị bàn phím ảo: việc hiển thị/ẩn bàn phím ảo được xử lý thủ công bằng tập lệnh.

## Ví dụ

Ví dụ sau đây cho thấy cách kiểm soát hành vi bàn phím ảo trên màn hình qua tập lệnh:

```js
const element = document.querySelector("input");

// the on-screen virtual keyboard behavior will be controlled by script manually
element.virtualKeyboardPolicy = "manual";
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Thuộc tính HTML toàn cục [`virtualkeyboardpolicy`](/en-US/docs/Web/HTML/Reference/Global_attributes/virtualkeyboardpolicy)
