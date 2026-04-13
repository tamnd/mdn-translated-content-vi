---
title: "Animation: thuộc tính id"
short-title: id
slug: Web/API/Animation/id
page-type: web-api-instance-property
browser-compat: api.Animation.id
---

{{ APIRef("Web Animations") }}

Thuộc tính **`Animation.id`** của [Web Animations API](/en-US/docs/Web/API/Web_Animations_API) trả về hoặc đặt một chuỗi dùng để nhận dạng hoạt ảnh.

## Giá trị

Một chuỗi có thể dùng để nhận dạng hoạt ảnh, hoặc `null` nếu hoạt ảnh không có `id`.

## Ví dụ

Trong [ví dụ trò chơi Red Queen's Race](/en-US/docs/Web/API/Web_Animations_API/Using_the_Web_Animations_API#other_useful_methods), bạn có thể gán cho `redQueenAlice` một `id` như sau:

```js
redQueenAlice.id = "redQueenAlice";
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("KeyframeEffect")}}
- [Web Animations API](/en-US/docs/Web/API/Web_Animations_API)
- {{domxref("Animation")}}
