---
title: <use>
slug: Web/SVG/Reference/Element/use
page-type: svg-element
browser-compat: svg.elements.use
sidebar: svgref
---

Phần tử **`<use>`** lấy các nút từ bên trong một tài liệu SVG, rồi sao chép chúng sang một vị trí khác.
Hiệu ứng này giống như các nút đó được sao chép sâu vào một DOM không hiển thị, rồi dán vào nơi phần tử `<use>` xuất hiện, tương tự như các phần tử {{HTMLElement("template")}} đã được sao chép.

## Ngữ cảnh sử dụng

{{SVGInfo}}

## Thuộc tính

- {{SVGAttr("href")}}
  - : URL tới một phần tử/mảnh cần được sao chép. Xem [Lưu ý sử dụng](#usage_notes) để biết chi tiết về các lỗi thường gặp.<br/> _Kiểu giá trị_: [**`<URL>`**](/en-US/docs/Web/SVG/Guides/Content_type#url); _Giá trị mặc định_: none; _Có thể hoạt ảnh_: **có**
- {{SVGAttr("xlink:href")}} {{Deprecated_Inline}}
  - : Một tham chiếu [`<IRI>`](/en-US/docs/Web/SVG/Guides/Content_type#iri) tới một phần tử/mảnh cần được sao chép. Nếu cả {{SVGAttr("href")}} và {{SVGAttr("xlink:href")}} đều có mặt, giá trị do {{SVGAttr("href")}} cung cấp sẽ được dùng.<br/> _Kiểu giá trị_: [**`<IRI>`**](/en-US/docs/Web/SVG/Guides/Content_type#iri); _Giá trị mặc định_: none; _Có thể hoạt ảnh_: **có**
    > [!WARNING]
    > Kể từ SVG 2, thuộc tính {{SVGAttr("xlink:href")}} đã bị loại bỏ để thay bằng {{SVGAttr("href")}}. Xem trang {{SVGAttr("xlink:href")}} để biết thêm thông tin.
- {{SVGAttr("x")}}
  - : Tọa độ x của một phép dịch chuyển cuối bổ sung được áp dụng cho phần tử `<use>`.<br/> _Kiểu giá trị_: [**`<coordinate>`**](/en-US/docs/Web/SVG/Guides/Content_type#coordinate); _Giá trị mặc định_: `0`; _Có thể hoạt ảnh_: **có**
- {{SVGAttr("y")}}
  - : Tọa độ y của một phép dịch chuyển cuối bổ sung được áp dụng cho phần tử `<use>`.<br/> _Kiểu giá trị_: [**`<coordinate>`**](/en-US/docs/Web/SVG/Guides/Content_type#coordinate); _Giá trị mặc định_: `0`; _Có thể hoạt ảnh_: **có**
- {{SVGAttr("width")}}
  - : Chiều rộng của phần tử `<use>`.<br/> _Kiểu giá trị_: [**`<length>`**](/en-US/docs/Web/SVG/Guides/Content_type#length); _Giá trị mặc định_: `0`; _Có thể hoạt ảnh_: **có**
- {{SVGAttr("height")}}
  - : Chiều cao của phần tử `<use>`.<br/> _Kiểu giá trị_: [**`<length>`**](/en-US/docs/Web/SVG/Guides/Content_type#length); _Giá trị mặc định_: `0`; _Có thể hoạt ảnh_: **có**

> [!NOTE]
> `width` và `height` không có tác dụng với phần tử `<use>`, trừ khi phần tử được tham chiếu có [viewBox](/en-US/docs/Web/SVG/Reference/Attribute/viewBox) - tức là chúng chỉ có tác dụng khi `<use>` tham chiếu đến phần tử `<svg>` hoặc `<symbol>`.

> [!NOTE]
> Bắt đầu từ SVG2, `x`, `y`, `width` và `height` là _Geometry Properties_ (thuộc tính hình học), nghĩa là các thuộc tính đó cũng có thể được dùng như thuộc tính CSS cho phần tử này.

## Giao diện DOM

Phần tử này triển khai giao diện {{domxref("SVGUseElement")}}.

## Ví dụ

Ví dụ sau cho thấy cách dùng phần tử `<use>` để vẽ một hình tròn với màu fill và stroke khác nhau.
Ở hình tròn cuối, `stroke="red"` sẽ bị bỏ qua vì stroke đã được đặt trên `myCircle`.

```css hidden
html,
body,
svg {
  height: 100%;
}
```

```html
<svg viewBox="0 0 30 10" xmlns="http://www.w3.org/2000/svg">
  <circle id="myCircle" cx="5" cy="5" r="4" stroke="blue" />
  <use href="#myCircle" x="10" fill="blue" />
  <use href="#myCircle" x="20" fill="white" stroke="red" />
</svg>
```

{{EmbedLiveSample('Example', 200, 200)}}

## Lưu ý sử dụng

Hầu hết các thuộc tính trên `<use>` sẽ bị bỏ qua nếu thuộc tính tương ứng đã được định nghĩa trên phần tử được `<use>` tham chiếu tới. (Điều này khác với cách các thuộc tính kiểu CSS ghi đè lên những thuộc tính được đặt "sớm hơn" trong cascade).
**Chỉ** các thuộc tính {{SVGAttr("x")}}, {{SVGAttr("y")}}, {{SVGAttr("width")}}, {{SVGAttr("height")}} và {{SVGAttr("href")}} trên phần tử `<use>` mới sẽ hoặc có thể có tác dụng, được mô tả bên dưới, nếu phần tử được tham chiếu đã định nghĩa thuộc tính tương ứng. Tuy nhiên, _mọi thuộc tính khác_ không được đặt trên phần tử được tham chiếu **sẽ** được áp dụng cho phần tử `<use>`.

Vì các nút đã sao chép không được hiển thị ra ngoài, cần cẩn thận khi dùng [CSS](/en-US/docs/Web/CSS) để tạo kiểu cho phần tử `<use>` và các hậu duệ đã sao chép của nó. Không có gì đảm bảo rằng các thuộc tính CSS sẽ được kế thừa bởi DOM đã sao chép trừ khi bạn yêu cầu rõ ràng bằng [kế thừa CSS](/en-US/docs/Web/CSS/Guides/Cascade/Inheritance).

Vì lý do bảo mật, trình duyệt có thể áp dụng [chính sách cùng nguồn gốc](/en-US/docs/Web/Security/Defenses/Same-origin_policy) cho phần tử `<use>` và có thể từ chối tải một URL khác nguồn trong thuộc tính {{SVGAttr("href")}}. Hiện chưa có cách xác định để đặt chính sách khác nguồn cho phần tử `<use>`.

### Tải tài nguyên từ tệp ngoài qua `<use>`

Bạn có thể tải các nút từ một tệp SVG bên ngoài qua phần tử `<use>` bằng cách chỉ định đường dẫn của tệp theo sau là một mảnh URL trỏ tới `id` của nút cần tải:

```html
<svg>
  <use href="../assets/my-svg.svg#my-fragment"></use>
</svg>
```

Theo truyền thống, mảnh URL luôn là bắt buộc, ngay cả khi bạn chỉ muốn tải toàn bộ tài liệu SVG. Trong trường hợp như vậy, `id` sẽ được đặt trên phần tử gốc SVG:

```html
<svg xmlns="http://www.w3.org/2000/svg" id="my-fragment">
  <circle cx="150" cy="100" r="80" fill="green" />
</svg>
```

Tuy nhiên, các triển khai hiện đại đã được cập nhật để nếu bạn muốn tải toàn bộ tài liệu bên ngoài, bạn có thể tham chiếu nó mà không cần mảnh URL nữa (và `id` cũng không còn cần trên phần tử gốc của tài liệu SVG):

```html
<svg>
  <use href="../assets/my-svg.svg"></use>
</svg>
```

Kiểm tra bảng [Khả năng tương thích trình duyệt](#browser_compatibility) để biết hỗ trợ trình duyệt.

### Tải tài nguyên từ data URI qua `<use>`

Việc tải tài nguyên bằng data URI trong thuộc tính `href` đã bị loại bỏ vì lý do bảo mật. Điều này áp dụng cho `<use href="data:..."` và cả khi đặt `href` bằng phương thức [`set`](/en-US/docs/Web/SVG/Reference/Element/set) hoặc [`setAttribute`](/en-US/docs/Web/API/Element/setAttribute).

Một lần nữa, hãy kiểm tra bảng [Khả năng tương thích trình duyệt](#browser_compatibility) để biết hỗ trợ trình duyệt.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}
