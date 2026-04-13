---
title: "HTMLFencedFrameElement: allow property"
short-title: allow
slug: Web/API/HTMLFencedFrameElement/allow
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.HTMLFencedFrameElement.allow
---

{{SeeCompatTable}}{{APIRef("Fenced Frame API")}}

Thuộc tính **`allow`** của {{domxref("HTMLFencedFrameElement")}} lấy và đặt giá trị của thuộc tính `allow` của {{htmlelement("fencedframe")}} tương ứng, đại diện cho [Chính sách Quyền](/en-US/docs/Web/HTTP/Guides/Permissions_Policy) được áp dụng cho nội dung khi lần đầu nhúng vào.

Không phải tất cả chính sách quyền đều được cho phép trong các fenced frame. Các quyền được phép được liệt kê tại [Chính sách quyền có sẵn cho fenced frame](/en-US/docs/Web/HTML/Reference/Elements/fencedframe#permissions_policies_available_to_fenced_frames). Nếu bạn không đặt thuộc tính `allow`, các quyền đó sẽ được phép theo mặc định. Nếu bạn muốn thu hẹp tập hợp quyền, bạn cần đảm bảo tất cả các quyền cần thiết cho các API bạn đang sử dụng được đặt trong thuộc tính `allow`.

## Giá trị

Một chuỗi đại diện cho [Chính sách Quyền](/en-US/docs/Web/HTTP/Guides/Permissions_Policy).

## Ví dụ

```js
const frame = document.createElement("fencedframe");
console.log(frame.allow);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Fenced frames](https://privacysandbox.google.com/private-advertising/fenced-frame) trên privacysandbox.google.com
- [The Privacy Sandbox](https://privacysandbox.google.com/) trên privacysandbox.google.com
