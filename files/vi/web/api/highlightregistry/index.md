---
title: HighlightRegistry
slug: Web/API/HighlightRegistry
page-type: web-api-interface
browser-compat: api.HighlightRegistry
---

{{APIRef("CSS Custom Highlight API")}}

Giao diện **`HighlightRegistry`** thuộc [API CSS Custom Highlight](/en-US/docs/Web/API/CSS_Custom_Highlight_API) được dùng để đăng ký các đối tượng {{domxref("Highlight")}} nhằm áp dụng kiểu dáng thông qua API.
Truy cập thông qua {{domxref("CSS.highlights_static", "CSS.highlights")}}.

Một thực thể `HighlightRegistry` là một [đối tượng tương tự `Map`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Map#map-like_browser_apis), trong đó mỗi khóa là chuỗi tên của một highlight tùy chỉnh, và giá trị tương ứng là đối tượng {{domxref("Highlight")}} liên kết.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

_Giao diện `HighlightRegistry` không kế thừa thuộc tính nào._

- {{domxref("HighlightRegistry.size")}} {{ReadOnlyInline}}
  - : Trả về số lượng đối tượng `Highlight` hiện đang được đăng ký.

## Phương thức phiên bản

_Giao diện `HighlightRegistry` không kế thừa phương thức nào._

- {{domxref("HighlightRegistry.clear()")}}
  - : Xóa tất cả đối tượng `Highlight` khỏi sổ đăng ký.
- {{domxref("HighlightRegistry.delete()")}}
  - : Xóa đối tượng `Highlight` có tên chỉ định khỏi sổ đăng ký.
- {{domxref("HighlightRegistry.entries()")}}
  - : Trả về một đối tượng iterator mới chứa từng đối tượng `Highlight` trong sổ đăng ký, theo thứ tự chèn.
- {{domxref("HighlightRegistry.forEach()")}}
  - : Gọi hàm callback đã cho một lần cho mỗi đối tượng `Highlight` trong sổ đăng ký, theo thứ tự chèn.
- {{domxref("HighlightRegistry.get()")}}
  - : Lấy đối tượng `Highlight` có tên chỉ định từ sổ đăng ký.
- {{domxref("HighlightRegistry.has()")}}
  - : Trả về giá trị boolean cho biết liệu một đối tượng `Highlight` có tồn tại trong sổ đăng ký hay không.
- {{domxref("HighlightRegistry.highlightsFromPoint()")}} {{experimental_inline}}
  - : Trả về một mảng các đối tượng đại diện cho các highlight tùy chỉnh được áp dụng tại một điểm cụ thể trong viewport.
- {{domxref("HighlightRegistry.keys()")}}
  - : Bí danh của {{domxref("HighlightRegistry.values()")}}.
- {{domxref("HighlightRegistry.set()")}}
  - : Thêm đối tượng `Highlight` đã cho vào sổ đăng ký với tên chỉ định, hoặc cập nhật đối tượng `Highlight` có tên đó nếu nó đã tồn tại trong sổ đăng ký.
- {{domxref("HighlightRegistry.values()")}}
  - : Trả về một đối tượng iterator mới trả về các đối tượng `Highlight` trong sổ đăng ký, theo thứ tự chèn.

## Ví dụ

### Đăng ký một highlight

Ví dụ sau minh họa cách tạo các range, khởi tạo một đối tượng `Highlight` mới cho chúng, và đăng ký highlight bằng `HighlightRegistry` để áp dụng kiểu dáng trên trang:

#### HTML

```html
<p id="foo">CSS Custom Highlight API</p>
```

#### CSS

```css
::highlight(my-custom-highlight) {
  background-color: peachpuff;
}
```

#### JavaScript

```js
const text = document.getElementById("foo").firstChild;

if (!CSS.highlights) {
  text.textContent =
    "The CSS Custom Highlight API is not supported in this browser!";
}

// Create a couple of ranges.
const range1 = new Range();
range1.setStart(text, 0);
range1.setEnd(text, 3);

const range2 = new Range();
range2.setStart(text, 21);
range2.setEnd(text, 24);

// Create a custom highlight for these ranges.
const highlight = new Highlight(range1, range2);

// Register the ranges in the HighlightRegistry.
CSS.highlights.set("my-custom-highlight", highlight);
```

#### Kết quả

{{ EmbedLiveSample("Registering a highlight") }}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("css_custom_highlight_api", "The CSS Custom Highlight API", "", "nocode")}}
- [CSS custom highlight API](/en-US/docs/Web/CSS/Guides/Custom_highlight_API) module
- [CSS Custom Highlight API: The Future of Highlighting Text Ranges on the Web](https://css-tricks.com/css-custom-highlight-api-early-look/)
