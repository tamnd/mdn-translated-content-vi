---
title: <switch>
slug: Web/SVG/Reference/Element/switch
page-type: svg-element
browser-compat: svg.elements.switch
sidebar: svgref
---

**`<switch>`** [SVG](/en-US/docs/Web/SVG) đánh giá các thuộc tính {{SVGAttr("requiredFeatures")}}, {{SVGAttr("requiredExtensions")}} và {{SVGAttr("systemLanguage")}} trên các phần tử con trực tiếp của nó theo thứ tự, sau đó hiển thị phần tử con đầu tiên mà các thuộc tính này cho kết quả đúng.

Các phần tử con trực tiếp khác sẽ bị bỏ qua và vì vậy không được hiển thị. Nếu một phần tử con là phần tử chứa, như {{SVGElement("g")}}, thì toàn bộ cây con của nó cũng được xử lý/hiển thị hoặc bị bỏ qua/không hiển thị.

> [!NOTE]
> Các thuộc tính `display` và `visibility` không ảnh hưởng đến quá trình xử lý phần tử `<switch>`. Cụ thể, đặt `display:none` trên một phần tử con không có tác dụng đối với việc kiểm tra đúng/sai khi xử lý `<switch>`.

## Ngữ cảnh sử dụng

{{svginfo}}

## Thuộc tính

- {{SVGAttr("requiredExtensions")}}
  - : Một danh sách các giá trị URL được phân tách bằng khoảng trắng, tham chiếu đến các phần mở rộng ngôn ngữ mà user agent phải hỗ trợ để phần tử được hiển thị.

- {{SVGAttr("systemLanguage")}}
  - : Một danh sách các {{glossary("BCP 47 language tag", "thẻ ngôn ngữ")}} được phân tách bằng dấu phẩy.

## Giao diện DOM

Phần tử này triển khai giao diện {{domxref("SVGSwitchElement")}}.

## Ví dụ

Ví dụ này cho thấy cách hiển thị nội dung văn bản khác nhau tùy theo cài đặt ngôn ngữ của trình duyệt. Phần tử `<switch>` sẽ hiển thị phần tử con đầu tiên có thuộc tính {{SVGAttr("systemLanguage")}} khớp với ngôn ngữ của người dùng, hoặc phần tử dự phòng không có thuộc tính `systemLanguage` nếu không có phần tử nào khớp.

```html
<svg viewBox="0 -20 100 50">
  <switch>
    <text systemLanguage="ar">مرحبا</text>
    <text systemLanguage="de,nl">Hallo!</text>
    <text systemLanguage="en-us">Howdy!</text>
    <text systemLanguage="en-gb">Wotcha!</text>
    <text systemLanguage="en-au">G'day!</text>
    <text systemLanguage="en">Hello!</text>
    <text systemLanguage="es">Hola!</text>
    <text systemLanguage="fr">Bonjour!</text>
    <text systemLanguage="ja">こんにちは</text>
    <text systemLanguage="ru">Привет!</text>
    <text requiredExtensions="http://example.org/lang/ext/emoji">☺</text>
  </switch>
</svg>
```

{{ EmbedLiveSample('examples') }}

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{SVGAttr("requiredFeatures")}}
