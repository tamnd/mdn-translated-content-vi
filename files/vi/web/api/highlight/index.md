---
title: Highlight
slug: Web/API/Highlight
page-type: web-api-interface
browser-compat: api.Highlight
---

{{APIRef("CSS Custom Highlight API")}}

Giao diện **`Highlight`** của [CSS Custom Highlight API](/en-US/docs/Web/API/CSS_Custom_Highlight_API) được dùng để đại diện cho một tập hợp các phiên bản {{domxref("Range")}} được tạo kiểu bằng API.

Để tạo kiểu cho các phạm vi tùy ý trong một trang, hãy khởi tạo một đối tượng `Highlight` mới, thêm một hoặc nhiều đối tượng `Range` vào nó, và đăng ký nó bằng cách sử dụng {{domxref("HighlightRegistry")}}.

Một phiên bản `Highlight` là một [đối tượng giống `Set`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Set#set-like_browser_apis) có thể chứa một hoặc nhiều đối tượng `Range`.

{{InheritanceDiagram}}

## Hàm khởi tạo

- {{domxref("Highlight.Highlight()", "Highlight()")}}
  - : Trả về một đối tượng `Highlight` mới được tạo.

## Thuộc tính phiên bản

_Giao diện `Highlight` không kế thừa bất kỳ thuộc tính nào._

- {{domxref("Highlight.priority")}}
  - : Một số cho biết độ ưu tiên của đối tượng `Highlight` này. Khi nhiều vùng làm nổi bật chồng lên nhau, trình duyệt sử dụng độ ưu tiên này để quyết định cách tạo kiểu cho các phần chồng lên nhau.
- {{domxref("Highlight.size")}} {{ReadOnlyInline}}
  - : Trả về số lượng phạm vi trong đối tượng `Highlight`.
- {{domxref("Highlight.type")}}
  - : Một {{jsxref("String")}} liệt kê được dùng để chỉ định ý nghĩa ngữ nghĩa của vùng làm nổi bật. Điều này cho phép các công nghệ hỗ trợ bao gồm ý nghĩa này khi hiển thị vùng làm nổi bật cho người dùng.

## Phương thức phiên bản

_Giao diện `Highlight` không kế thừa bất kỳ phương thức nào._

- {{domxref("Highlight.add()")}}
  - : Thêm một phạm vi mới vào vùng làm nổi bật này.
- {{domxref("Highlight.clear()")}}
  - : Xóa tất cả các phạm vi khỏi vùng làm nổi bật này.
- {{domxref("Highlight.delete()")}}
  - : Xóa một phạm vi khỏi vùng làm nổi bật này.
- {{domxref("Highlight.entries()")}}
  - : Trả về một đối tượng iterator mới chứa mỗi phạm vi trong đối tượng làm nổi bật, theo thứ tự chèn vào.
- {{domxref("Highlight.forEach()")}}
  - : Gọi callback đã cho một lần cho mỗi phạm vi trong đối tượng làm nổi bật, theo thứ tự chèn vào.
- {{domxref("Highlight.has()")}}
  - : Trả về một giá trị boolean xác nhận liệu một phạm vi có tồn tại trong đối tượng làm nổi bật hay không.
- {{domxref("Highlight.keys()")}}
  - : Bí danh cho {{domxref("Highlight.values()")}}.
- {{domxref("Highlight.values()")}}
  - : Trả về một đối tượng iterator mới tạo ra các phạm vi trong đối tượng làm nổi bật theo thứ tự chèn vào.

## Ví dụ

Ví dụ sau đây minh họa cách làm nổi bật các phần cụ thể của một khối văn bản.

```html-nolint
<p class="foo">Lorem ipsum dolor sit amet consectetur adipisicing elit. Exercitationem
  sapiente non eum facere? Nam rem hic culpa, ipsa rerum ab itaque consectetur
  molestiae dolores vitae! Quo ex explicabo tempore? Tenetur.</p>
```

Đoạn mã JavaScript này tạo các [phạm vi](/en-US/docs/Web/API/Range), khởi tạo một đối tượng `Highlight` mới cho chúng, và [đăng ký nó](/en-US/docs/Web/API/HighlightRegistry/set) để tạo kiểu trên trang:

```js
const parentNode = document.querySelector(".foo");
const textNode = parentNode.firstChild;

// Create a couple of ranges.
const range1 = new Range();
range1.setStart(textNode, 6);
range1.setEnd(textNode, 21);

const range2 = new Range();
range2.setStart(textNode, 57);
range2.setEnd(textNode, 71);

// Create a custom highlight for these ranges.
const highlight = new Highlight(range1, range2);

// Register the ranges in the HighlightRegistry.
CSS.highlights.set("my-custom-highlight", highlight);
```

Đoạn mã CSS sau minh họa cách tạo kiểu cho vùng làm nổi bật tùy chỉnh đã đăng ký bằng cách sử dụng phần tử giả {{cssxref("::highlight")}}:

```css
::highlight(my-custom-highlight) {
  background-color: peachpuff;
}
```

### Kết quả

{{EmbedLiveSample("example", "100%", '100')}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("css_custom_highlight_api", "The CSS Custom Highlight API", "", "nocode")}}
- [CSS custom highlight API](/en-US/docs/Web/CSS/Guides/Custom_highlight_API) module
- [CSS Custom Highlight API: The Future of Highlighting Text Ranges on the Web](https://css-tricks.com/css-custom-highlight-api-early-look/)
