---
title: Hoạt ảnh SVG với SMIL
slug: Web/SVG/Guides/SVG_animation_with_SMIL
page-type: guide
sidebar: svgref
---

[Synchronized Multimedia Integration Language](https://www.w3.org/TR/SMIL/) (SMIL) là một ngôn ngữ dựa trên XML để viết các bài trình bày đa phương tiện tương tác.
Tác giả có thể dùng cú pháp SMIL trong các ngôn ngữ dựa trên XML khác để định nghĩa thời gian và bố cục của các phần tử cho hoạt ảnh.

SMIL cho phép bạn:

- tạo hoạt ảnh cho các thuộc tính số của một phần tử ([x](/en-US/docs/Web/SVG/Reference/Attribute/x), [y](/en-US/docs/Web/SVG/Reference/Attribute/y), v.v.)
- tạo hoạt ảnh cho các thuộc tính [transform](/en-US/docs/Web/SVG/Reference/Attribute/transform) ([translation](/en-US/docs/Web/SVG/Reference/Attribute/transform#translate), [rotate](/en-US/docs/Web/SVG/Reference/Attribute/transform#rotate), v.v.)
- tạo hoạt ảnh cho các thuộc tính [màu sắc](/en-US/docs/Web/SVG/Reference/Attribute/color)
- di chuyển theo một [đường dẫn](/en-US/docs/Web/SVG/Reference/Element/path)

Các phần dưới đây cho thấy cách dùng SMIL trong [SVG](/en-US/docs/Web/SVG) cho bốn trường hợp sử dụng này.

## Tạo hoạt ảnh cho các thuộc tính của một phần tử

Ví dụ sau tạo hoạt ảnh cho thuộc tính [`cx`](/en-US/docs/Web/SVG/Reference/Attribute/cx) của một hình tròn. Để làm vậy, chúng ta thêm phần tử {{ SVGElement("animate") }} bên trong phần tử {{ SVGElement("circle") }}. Các thuộc tính quan trọng của {{ SVGElement("animate") }} là:

- `attributeName`
  - : Tên của thuộc tính cần tạo hoạt ảnh.
- `from`
  - : Giá trị ban đầu của thuộc tính.
- `to`
  - : Giá trị cuối cùng.
- `dur`
  - : Thời lượng của hoạt ảnh (ví dụ, viết '5s' cho 5 giây).

Nếu bạn muốn tạo hoạt ảnh cho nhiều thuộc tính hơn trong cùng một phần tử, bạn có thể thêm nhiều phần tử {{ SVGElement("animate") }} hơn.

```html
<svg width="300" height="100">
  <title>Hoạt ảnh thuộc tính với SMIL</title>
  <rect x="0" y="0" width="300" height="100" stroke="black" stroke-width="1" />
  <circle cx="0" cy="50" r="15" fill="blue" stroke="black" stroke-width="1">
    <animate
      attributeName="cx"
      from="0"
      to="500"
      dur="5s"
      repeatCount="indefinite" />
  </circle>
</svg>
```

{{ EmbedLiveSample('Animating_attributes_of_an_element', '100%', 120) }}

## Tạo hoạt ảnh cho các thuộc tính transform

Phần tử {{ SVGElement("animateTransform") }} cho phép bạn tạo hoạt ảnh cho các thuộc tính [transform](/en-US/docs/Web/SVG/Reference/Attribute/transform). Phần tử này là cần thiết vì chúng ta không tạo hoạt ảnh cho một thuộc tính đơn như [x](/en-US/docs/Web/SVG/Reference/Attribute/x), vốn là một con số. Các thuộc tính quay trông như thế này: `rotation(theta, x, y)`, trong đó `theta` là góc tính bằng độ, còn `x` và `y` là các vị trí tuyệt đối. Trong ví dụ dưới đây, chúng ta tạo hoạt ảnh cho tâm quay và góc quay.

```html
<svg width="300" height="100">
  <title>SVG SMIL Animate với transform</title>
  <rect x="0" y="0" width="300" height="100" stroke="black" stroke-width="1" />
  <rect
    x="0"
    y="50"
    width="15"
    height="34"
    fill="blue"
    stroke="black"
    stroke-width="1">
    <animateTransform
      attributeName="transform"
      begin="0s"
      dur="20s"
      type="rotate"
      from="0 60 60"
      to="360 100 60"
      repeatCount="indefinite" />
  </rect>
</svg>
```

{{ EmbedLiveSample('Animating_the_transform_attributes', '100%', 120) }}

## Hoạt ảnh đi theo một đường dẫn

Phần tử {{ SVGElement("animateMotion") }} cho phép bạn tạo hoạt ảnh cho vị trí và góc quay của một phần tử theo một đường dẫn. Đường dẫn được định nghĩa giống như trong {{ SVGElement("path") }}. Bạn có thể đặt thuộc tính để xác định liệu đối tượng có xoay theo tiếp tuyến của đường dẫn hay không.

### Ví dụ 1: Chuyển động tuyến tính

Trong ví dụ này, một hình tròn xanh dương bật qua lại giữa mép trái và mép phải của một hộp đen, lặp đi lặp lại không ngừng. Hoạt ảnh ở đây được xử lý bởi phần tử {{ SVGElement("animateMotion") }}. Trong trường hợp này, chúng ta thiết lập một đường dẫn gồm lệnh **MoveTo** để xác định điểm bắt đầu của hoạt ảnh, sau đó là lệnh **Horizontal-line** để di chuyển hình tròn sang phải 300 pixel, tiếp theo là lệnh **Z**, lệnh này đóng đường dẫn và tạo một vòng lặp quay về điểm đầu. Bằng cách đặt giá trị của thuộc tính **repeatCount** thành `indefinite`, chúng ta cho biết hoạt ảnh phải lặp mãi miễn là ảnh SVG còn tồn tại.

```html
<svg xmlns="http://www.w3.org/2000/svg" width="300" height="100">
  <title>SVG SMIL Animate với đường dẫn</title>
  <rect x="0" y="0" width="300" height="100" stroke="black" stroke-width="1" />
  <circle cx="0" cy="50" r="15" fill="blue" stroke="black" stroke-width="1">
    <animateMotion path="M 0 0 H 300 Z" dur="3s" repeatCount="indefinite" />
  </circle>
</svg>
```

{{ EmbedLiveSample('Example_1_Linear_motion', '100%', 120) }}

[Xem mẫu trực tiếp](https://mdn.dev/archives/media/samples/svg/svganimdemo1.html)

### Ví dụ 2: Chuyển động cong

Cùng ví dụ như trên nhưng với một đường cong và di chuyển theo hướng của đường dẫn.

```html
<svg width="300" height="100">
  <title>SVG SMIL Animate với đường dẫn</title>
  <rect x="0" y="0" width="300" height="100" stroke="black" stroke-width="1" />
  <rect
    x="0"
    y="0"
    width="20"
    height="20"
    fill="blue"
    stroke="black"
    stroke-width="1">
    <animateMotion
      path="M 250,80 H 50 Q 30,80 30,50 Q 30,20 50,20 H 250 Q 280,20,280,50 Q 280,80,250,80Z"
      dur="3s"
      repeatCount="indefinite"
      rotate="auto" />
  </rect>
</svg>
```

{{ EmbedLiveSample('Example_2_Curved_motion', '100%', 120) }}

## Xem thêm

- [SVG](/en-US/docs/Web/SVG)
- [Đặc tả SVG Animation](https://svgwg.org/svg2-draft/animate.html)
- [Đặc tả SMIL](https://www.w3.org/TR/SMIL/)
