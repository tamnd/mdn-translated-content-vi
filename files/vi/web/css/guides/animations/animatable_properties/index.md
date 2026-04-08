---
title: Animatable CSS properties
short-title: Animatable properties
slug: Web/CSS/Guides/Animations/Animatable_properties
page-type: guide
sidebar: cssref
---

[CSS Animations](/en-US/docs/Web/CSS/Guides/Animations) và [Transitions](/en-US/docs/Web/CSS/Guides/Transitions) dựa trên khái niệm các thuộc tính **có thể tạo animation**, và tất cả các thuộc tính CSS đều có thể tạo animation trừ khi được chỉ định khác. _Kiểu animation_ của mỗi thuộc tính xác định cách các giá trị [kết hợp](https://drafts.csswg.org/css-values/#combining-values) — interpolate, add, hoặc accumulate — cho thuộc tính đó. Transitions chỉ liên quan đến interpolation, trong khi animations có thể sử dụng cả ba phương thức kết hợp.

> [!NOTE]
> Kiểu animation của mỗi thuộc tính CSS được liệt kê trong bảng "Formal definition" của nó (ví dụ: {{CSSXref("color", "", "#formal_definition")}}).

> [!NOTE]
> Phương thức interpolation cho mỗi kiểu dữ liệu CSS được mô tả trong phần "Interpolation" của nó (ví dụ: {{CSSXref("&lt;length&gt;", "", "#interpolation")}}).

## Các kiểu animation

Có bốn kiểu animation chính được định nghĩa trong đặc tả [Web Animations](https://drafts.csswg.org/web-animations-1/#animating-properties):

- Not animatable
  - : Thuộc tính không thể tạo animation. Nó không được xử lý khi được liệt kê trong một keyframe animation và không bị ảnh hưởng bởi transition.

    > [!NOTE]
    > Một animation effect chỉ nhắm vào các thuộc tính không thể tạo animation vẫn sẽ thể hiện hành vi thông thường của một animation effect (ví dụ: kích hoạt sự kiện {{DOMXref("Element/animationstart_event", "animationstart")}}).

- Discrete
  - : Các giá trị của thuộc tính không có tính cộng gộp, và interpolation chuyển từ giá trị bắt đầu sang giá trị kết thúc tại `50%`. Cụ thể, ký hiệu `p` là giá trị tiến trình:
    - Nếu `p < 0.5`, thì `V_result = V_start`;
    - Nếu `p ≥ 0.5`, thì `V_result = V_end`.

- By computed value
  - : Các thành phần riêng lẻ tương ứng của các giá trị được tính toán được kết hợp bằng quy trình đã chỉ định cho kiểu giá trị đó. Nếu số lượng thành phần hoặc kiểu của các thành phần tương ứng không khớp, hoặc nếu bất kỳ giá trị thành phần nào sử dụng discrete animation và hai giá trị tương ứng không khớp, thì các giá trị thuộc tính sẽ kết hợp theo kiểu discrete.

- Repeatable list
  - : Giống như by computed value ngoại trừ việc nếu hai danh sách có số lượng phần tử khác nhau, chúng sẽ được lặp lại trước đến bội số chung nhỏ nhất của số phần tử. Sau đó mỗi phần tử được kết hợp theo computed value. Nếu một cặp giá trị không thể kết hợp hoặc bất kỳ giá trị thành phần nào sử dụng discrete animation, thì các giá trị thuộc tính sẽ kết hợp theo kiểu discrete.

Một số thuộc tính có hành vi interpolation cụ thể không được đề cập trong bốn kiểu này. Trong trường hợp đó, hãy tham khảo phần "Interpolation" của thuộc tính đó (ví dụ: {{CSSXref("visibility", "", "#interpolation")}}).

## Tạo animation cho custom property

Đối với các custom property được đăng ký bằng phương thức {{DOMXref("CSS/registerProperty_static", "registerProperty()")}}, kiểu animation là by computed value, với kiểu computed value được [xác định](https://drafts.css-houdini.org/css-properties-values-api/#calculation-of-computed-values) bởi định nghĩa cú pháp của thuộc tính.

Đối với các custom property chưa được đăng ký, kiểu animation là discrete.

## Xem thêm

- {{cssxref("transition-behavior")}}
- {{cssxref("@starting-style")}}
- Module [CSS animations](/en-US/docs/Web/CSS/Guides/Animations)
- [Using CSS Animations](/en-US/docs/Web/CSS/Guides/Animations/Using)
- [Using CSS Transitions](/en-US/docs/Web/CSS/Guides/Transitions/Using)
