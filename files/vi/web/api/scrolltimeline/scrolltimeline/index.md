---
title: "ScrollTimeline: ScrollTimeline() constructor"
short-title: ScrollTimeline()
slug: Web/API/ScrollTimeline/ScrollTimeline
page-type: web-api-constructor
browser-compat: api.ScrollTimeline.ScrollTimeline
---

{{APIRef("History API")}}

Hàm khởi tạo **`ScrollTimeline()`** tạo một thực thể đối tượng {{domxref("ScrollTimeline")}} mới.

## Cú pháp

```js-nolint
new ScrollTimeline(options)
```

### Tham số

- `options`
  - : Một đối tượng có thể chứa các thuộc tính sau:
    - `source`
      - : Tham chiếu đến một {{domxref("Element")}} đại diện cho phần tử có thể cuộn (_scroller_) có vị trí cuộn sẽ điều khiển tiến trình của timeline.
    - `axis` {{optional_inline}}
      - : Giá trị liệt kê đại diện cho trục cuộn sẽ điều khiển tiến trình của timeline. Các giá trị có thể là:
        - `"block"`: Thanh cuộn trên trục block của scroll container, là trục theo hướng vuông góc với luồng văn bản trong một dòng. Đối với các chế độ viết ngang như tiếng Anh chuẩn, giá trị này giống `"y"`, còn với chế độ viết dọc thì giống `"x"`.
        - `"inline"`: Thanh cuộn trên trục inline của scroll container, là trục theo hướng song song với luồng văn bản trong một dòng. Đối với các chế độ viết ngang, giá trị này giống `"x"`, còn với chế độ viết dọc thì giống `"y"`.
        - `"y"`: Thanh cuộn trên trục dọc của scroll container.
        - `"x"`: Thanh cuộn trên trục ngang của scroll container.

        Nếu bỏ qua, `axis` mặc định là `"block"`.

### Giá trị trả về

Một thực thể đối tượng {{domxref("ScrollTimeline")}} mới.

## Ví dụ

Xem trang chính {{domxref("ScrollTimeline")}} để biết ví dụ.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Web Animations API](/en-US/docs/Web/API/Web_Animations_API)
- [CSS scroll-driven animations](/en-US/docs/Web/CSS/Guides/Scroll-driven_animations)
- {{domxref("ScrollTimeline")}}
- {{domxref("AnimationTimeline")}}, {{domxref("ViewTimeline")}}
