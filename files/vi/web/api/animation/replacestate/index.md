---
title: "Animation: thuộc tính replaceState"
short-title: replaceState
slug: Web/API/Animation/replaceState
page-type: web-api-instance-property
browser-compat: api.Animation.replaceState
---

{{ APIRef("Web Animations") }}

Thuộc tính chỉ đọc **`Animation.replaceState`** của [Web Animations API](/en-US/docs/Web/API/Web_Animations_API) cho biết liệu hoạt ảnh đã bị [trình duyệt tự động loại bỏ](/en-US/docs/Web/API/Web_Animations_API/Using_the_Web_Animations_API#automatically_removing_filling_animations) sau khi bị thay thế bởi một hoạt ảnh khác hay chưa.

## Giá trị

Một chuỗi biểu diễn trạng thái thay thế của hoạt ảnh. Giá trị có thể là một trong các giá trị sau:

- `active`
  - : Giá trị ban đầu của trạng thái thay thế của hoạt ảnh khi hoạt ảnh được tạo ra.
- `persisted`
  - : Hoạt ảnh đã được lưu giữ một cách tường minh bằng cách gọi {{domxref("Animation.persist()")}} trên nó.
- `removed`
  - : Hoạt ảnh đã bị trình duyệt tự động loại bỏ.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Web Animations API](/en-US/docs/Web/API/Web_Animations_API)
- {{domxref("Animation")}}
- Sự kiện {{domxref("Animation.remove_event","remove")}}
- {{domxref("Animation.persist()")}}
