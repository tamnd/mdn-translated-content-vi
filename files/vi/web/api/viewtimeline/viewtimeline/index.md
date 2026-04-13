---
title: "ViewTimeline: ViewTimeline() constructor"
short-title: ViewTimeline()
slug: Web/API/ViewTimeline/ViewTimeline
page-type: web-api-constructor
browser-compat: api.ViewTimeline.ViewTimeline
---

{{APIRef("History API")}}

Hàm khởi tạo **`ViewTimeline()`** tạo một phiên bản đối tượng {{domxref("ViewTimeline")}} mới.

## Cú pháp

```js-nolint
new ViewTimeline(options)
```

### Tham số

- `options`
  - : Một đối tượng có thể chứa các thuộc tính sau:
    - `subject`
      - : Tham chiếu đến một {{domxref("Element")}} biểu diễn phần tử subject mà khả năng hiển thị của nó trong phần tử scrollable tổ tiên gần nhất (scroller) sẽ điều khiển tiến trình của dòng thời gian.
    - `axis` {{optional_inline}}
      - : Giá trị liệt kê biểu diễn trục cuộn sẽ điều khiển tiến trình của dòng thời gian. Các giá trị có thể:
        - `"block"`: Thanh cuộn trên trục block của container cuộn, là trục theo hướng vuông góc với luồng văn bản trong một dòng.
        - `"inline"`: Thanh cuộn trên trục inline của container cuộn, là trục theo hướng song song với luồng văn bản trong một dòng.
        - `"y"`: Thanh cuộn trên trục dọc của container cuộn.
        - `"x"`: Thanh cuộn trên trục ngang của container cuộn.

        Nếu bỏ qua, `axis` mặc định là `"block"`.

    - `inset` {{optional_inline}}
      - : Giá trị hoặc mảng các giá trị biểu diễn sự điều chỉnh vị trí của scrollport (xem {{glossary("Scroll container")}} để biết thêm chi tiết) mà subject được coi là hiển thị trong đó. Các giá trị có thể:
        - `"auto"`: Sử dụng vị trí hộp mặc định.
        - Chuỗi: Nếu một chuỗi được chỉ định, nó có thể bao gồm một hoặc hai giá trị bằng `auto` hoặc giá trị CSS {{cssxref("length-percentage")}}.
        - Mảng một hoặc hai giá trị, có thể là `"auto"` hoặc {{domxref("CSSNumericValue")}} phù hợp. Nếu mảng được cung cấp, giá trị đầu tiên biểu diễn inset bắt đầu và giá trị thứ hai biểu diễn inset kết thúc.

        Nếu mảng chỉ có một giá trị, nó sẽ được nhân đôi. Nếu bỏ qua, `inset` mặc định là `auto`.

### Giá trị trả về

Một phiên bản đối tượng {{domxref("ViewTimeline")}} mới.

## Ví dụ

Xem trang {{domxref("ViewTimeline")}} chính để tham khảo ví dụ.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Web Animations API](/en-US/docs/Web/API/Web_Animations_API)
- [CSS scroll-driven animations](/en-US/docs/Web/CSS/Guides/Scroll-driven_animations)
- {{domxref("ViewTimeline")}}
- {{domxref("AnimationTimeline")}}, {{domxref("ScrollTimeline")}}
