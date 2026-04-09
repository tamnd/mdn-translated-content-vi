---
title: Text fragments
slug: Web/URI/Reference/Fragment/Text_fragments
page-type: uri-component
browser-compat:
  - html.elements.a.text_fragments
  - api.FragmentDirective
  - css.selectors.target-text
sidebar: urlsidebar
---

**Text fragments** liên kết trực tiếp đến văn bản cụ thể trong một trang web mà không cần tác giả trang thêm ID. Chúng dùng một cú pháp đặc biệt trong phần fragment của URL. Tính năng này cho phép bạn tạo liên kết sâu tới nội dung mà bạn không kiểm soát và có thể không có ID đi kèm. Nó cũng làm cho việc chia sẻ liên kết hữu ích hơn vì có thể trỏ trực tiếp người khác đến các từ cụ thể. Các trình duyệt có thể khác nhau trong cách làm nổi bật văn bản được liên kết, nhưng thông thường văn bản sẽ được cuộn đến vị trí hiển thị và được tô sáng bằng màu.

## Khái niệm và cách dùng

Trong lịch sử, một trong những tính năng cốt lõi của web luôn là khả năng cung cấp liên kết giữa các tài liệu khác nhau - đó chính là điều biến _web_ thành một mạng lưới:

- Bạn có thể liên kết đến đầu tài liệu bằng cách liên kết đến URL của nó, ví dụ:
  - [https://developer.mozilla.org/en-US/docs/Web/HTML/Reference/Elements/a](/en-US/docs/Web/HTML/Reference/Elements/a).
- Bạn có thể liên kết đến một phần cụ thể của tài liệu bằng cách liên kết đến URL của nó cộng với _document fragment_ (ID) của phần đó, ví dụ:
  - [https://developer.mozilla.org/en-US/docs/Web/HTML/Reference/Elements/a#browser_compatibility](/en-US/docs/Web/HTML/Reference/Elements/a#browser_compatibility).

Vấn đề khi liên kết đến các document fragment cụ thể là tác giả của trang được liên kết cần đặt một anchor để _thực sự_ liên kết tới. Ví dụ thứ hai ở trên liên kết đến một phần tử {{htmlelement("Heading_Elements", "h2")}} có ID là `browser_compatibility`:

```html
<h2 id="browser_compatibility">
  <a href="#browser_compatibility">Tương thích trình duyệt</a>
</h2>
```

Không phải tài liệu nào cũng có anchor như vậy, và ngay cả khi có, việc liên kết đến một heading có thể kém trực quan hơn nhiều so với việc liên kết trực tiếp đến đoạn văn bản cụ thể mà bạn đang trích dẫn. Đây là lúc text fragments phát huy tác dụng: chúng cho phép tác giả của liên kết kiểm soát hoàn toàn văn bản nào sẽ được liên kết, mà không cần bất kỳ đánh dấu đặc biệt nào trong tài liệu đích. Ví dụ, một công cụ tìm kiếm có thể tham chiếu đến một câu cụ thể trong kết quả tìm kiếm của nó, và khi nhấp vào liên kết, bạn sẽ được đưa thẳng đến câu đó.

Tuy nhiên, text fragments cũng có một hạn chế: văn bản trong tài liệu kém ổn định hơn cấu trúc tài liệu. Nếu văn bản trong tài liệu được liên kết bị cập nhật, fragment sẽ không còn khớp nữa, và trình duyệt sẽ điều hướng lên đầu trang. Điều này ổn với các liên kết tạm thời như trong kết quả tìm kiếm, nhưng nếu bạn muốn liên kết hoạt động theo thời gian, document fragments có thể đáng tin cậy hơn.

## Cú pháp

```url
https://example.com#:~:text=[prefix-,]textStart[,textEnd][,-suffix]
```

Text fragments là một loại fragment của URL, và được viết sau dấu `#`. Các phần chính cần hiểu là:

- `:~:`
  - : Còn được gọi là _fragment directive_, chuỗi ký tự này cho trình duyệt biết rằng phần tiếp theo là một hoặc nhiều chỉ thị cho user agent, các chỉ thị này sẽ bị loại khỏi URL trong quá trình tải để mã tác giả không thể tương tác trực tiếp với chúng. Chỉ thị cho user agent còn được gọi là directives.
- `text=`
  - : Một text directive. Nó cung cấp một text fragment cho trình duyệt, xác định văn bản nào sẽ được liên kết trong tài liệu đích.
- `textStart`
  - : Một chuỗi văn bản chỉ định phần bắt đầu của văn bản được liên kết.
- `textEnd` {{optional_inline}}
  - : Một chuỗi văn bản chỉ định phần kết thúc của văn bản được liên kết.
- `prefix-` {{optional_inline}}
  - : Một chuỗi văn bản theo sau bởi dấu gạch ngang, chỉ định văn bản nào phải đứng ngay trước văn bản được liên kết, chỉ cho phép khoảng trắng ở giữa. Điều này giúp trình duyệt chọn đúng văn bản được liên kết trong các trường hợp có nhiều kết quả khớp.
- `-suffix` {{optional_inline}}
  - : Một dấu gạch ngang theo sau bởi một chuỗi văn bản, chỉ định văn bản nào phải đứng ngay sau văn bản được liên kết, chỉ cho phép khoảng trắng ở giữa. Điều này giúp trình duyệt chọn đúng văn bản được liên kết trong các trường hợp có nhiều kết quả khớp.

Các trình duyệt hỗ trợ sẽ cuộn đến và tô sáng text fragment đầu tiên trong tài liệu đích khớp với directive đã chỉ định. Lưu ý rằng bạn có thể chỉ định nhiều text fragment để làm nổi bật trong cùng một URL bằng cách tách chúng bằng ký tự dấu và (`&`).

### Ghi chú sử dụng

- Các chuỗi văn bản dùng cho các giá trị `textStart`, `textEnd`, `prefix-` và `-suffix` cần được [mã hóa phần trăm](/en-US/docs/Web/JavaScript/Reference/Global_Objects/encodeURIComponent). Ngoài ra, [tiêu chuẩn](https://wicg.github.io/scroll-to-text-fragment/#syntax) còn yêu cầu ký tự gạch ngang an toàn cho URL `'-'` cũng phải được mã hóa phần trăm tương tự.
- Các kết quả khớp không phân biệt chữ hoa chữ thường.
- Các chuỗi `textStart`, `textEnd`, `prefix-` và `-suffix` riêng lẻ cần nằm trọn vẹn trong cùng một [phần tử cấp khối](/en-US/docs/Glossary/Block-level_content), nhưng các kết quả khớp hoàn chỉnh có thể trải qua nhiều ranh giới phần tử.
- Vì lý do bảo mật, khi liên kết đến một trang cross-origin bằng tính năng này, bạn nên mở liên kết trong ngữ cảnh `noopener` - bạn cần thêm `rel="noopener"` vào các phần tử {{htmlelement("a")}} của mình, và thêm `noopener` vào các lời gọi {{domxref("window.open()")}} khi dùng tính năng này.
- Text fragments chỉ được kích hoạt khi điều hướng do người dùng khởi tạo.
- Text fragments chỉ được áp dụng cho khung chính; văn bản sẽ không được tìm kiếm bên trong các {{htmlelement("iframe")}}, và việc điều hướng `iframe` sẽ không kích hoạt text fragment.
- Với các site muốn từ chối tính năng này, các trình duyệt dựa trên Chromium hỗ trợ giá trị header [Document Policy](https://wicg.github.io/document-policy/) mà họ có thể gửi để user agent không xử lý Text Fragments:

  ```http
  Document-Policy: force-load-at-top
  ```

> [!NOTE]
> Nếu text fragment được cung cấp không khớp với bất kỳ văn bản nào trong tài liệu đích, hoặc nếu trình duyệt không hỗ trợ text fragments, toàn bộ text fragment sẽ bị bỏ qua và đầu tài liệu sẽ được liên kết.

## Ví dụ

### Text fragment với textStart

- [https://example.com/#:~:text=use](https://example.com/#:~:text=use) cuộn đến và tô sáng lần xuất hiện đầu tiên của văn bản `use` trong tài liệu.
- [https://developer.mozilla.org/en-US/docs/Web/HTML/Reference/Elements/a#:~:text=human](/en-US/docs/Web/HTML/Reference/Elements/a#:~:text=human) cuộn đến và tô sáng lần xuất hiện đầu tiên của văn bản `human` trong tài liệu.
- [https://developer.mozilla.org/en-US/docs/Web/HTML/Reference/Elements/a#:~:text=linked%20URL](/en-US/docs/Web/HTML/Reference/Elements/a#:~:text=linked%20URL) cuộn đến và tô sáng lần xuất hiện đầu tiên của văn bản `linked URL` trong tài liệu.

### textStart và textEnd

- [https://developer.mozilla.org/en-US/docs/Web/HTML/Reference/Elements/a#:~:text=human,URL](/en-US/docs/Web/HTML/Reference/Elements/a#:~:text=human,url) cuộn đến và tô sáng lần xuất hiện đầu tiên của chuỗi văn bản bắt đầu bằng `human` và kết thúc bằng `URL`.
- [https://developer.mozilla.org/en-US/docs/Web/HTML/Reference/Elements/a#:~:text=linked%20URL,defining%20a%20value](/en-US/docs/Web/HTML/Reference/Elements/a#:~:text=linked%20URL,defining%20a%20value) cuộn đến và tô sáng lần xuất hiện đầu tiên của chuỗi văn bản bắt đầu bằng `linked URL` và kết thúc bằng `defining a value`. Lưu ý rằng văn bản được tô sáng trải qua nhiều phần tử cấp khối.

### Ví dụ với prefix- và/hoặc -suffix

- [https://example.com/#:~:text=avoid-,use](https://example.com/#:~:text=avoid-,use) cuộn đến và tô sáng lần xuất hiện thứ hai của văn bản `use` trong tài liệu.
- [https://developer.mozilla.org/en-US/docs/Web/HTML/Reference/Elements/a#:~:text=sent-,referrer](/en-US/docs/Web/HTML/Reference/Elements/a#:~:text=sent-,referrer) cuộn đến và tô sáng lần xuất hiện đầu tiên của văn bản `referrer` có văn bản `sent` đứng ngay trước nó. Đây là lần xuất hiện thứ 5 của `referrer` trong tài liệu; nếu không có prefix, lần xuất hiện đầu tiên sẽ được tô sáng.
- [https://developer.mozilla.org/en-US/docs/Web/HTML/Reference/Elements/a#:~:text=linked%20URL,-'s%20format](/en-US/docs/Web/HTML/Reference/Elements/a#:~:text=linked%20URL,-'s%20format) cuộn đến và tô sáng lần xuất hiện đầu tiên của văn bản `linked URL` có văn bản `'s format` đứng ngay sau nó. Đây là lần xuất hiện thứ 5 của `linked URL` trong tài liệu; nếu không có suffix, lần xuất hiện đầu tiên sẽ được tô sáng.
- [https://developer.mozilla.org/en-US/docs/Web/HTML/Reference/Elements/a#:~:text=downgrade:-,The%20Referer,be%20sent,-to%20origins](/en-US/docs/Web/HTML/Reference/Elements/a#:~:text=downgrade:-,The%20Referer,be%20sent,-to%20origins) cuộn đến và tô sáng lần xuất hiện của văn bản `The Referer ... be sent` có prefix `downgrade:` và suffix `to origins`. Đây là một ví dụ phức tạp hơn, trong đó prefix/suffix được dùng để khoanh vùng đúng trường hợp văn bản mà bạn muốn liên kết. Hãy thử bỏ prefix, chẳng hạn, và xem phần nào được khớp.

### URL có nhiều text fragment

Bạn có thể chỉ định nhiều text fragment để tô sáng trong cùng một URL bằng cách tách chúng bằng ký tự dấu và (`&`). Hãy xem một vài ví dụ:

- [https://developer.mozilla.org/en-US/docs/Web/HTML/Reference/Elements/a#:~:text=Causes&text=linked](/en-US/docs/Web/HTML/Reference/Elements/a#:~:text=causes&text=linked) cuộn đến và tô sáng lần xuất hiện đầu tiên của các chuỗi văn bản `Causes` và `linked`.
- [https://developer.mozilla.org/en-US/docs/Web/HTML/Reference/Elements/a#:~:text=linked%20URL,-'s%20format&text=Deprecated-,attributes,attribute](/en-US/docs/Web/HTML/Reference/Elements/a#:~:text=linked%20URL,-'s%20format&text=Deprecated-,attributes,attribute) cuộn đến và tô sáng hai văn bản:
  - Lần xuất hiện đầu tiên của văn bản `linked URL` có văn bản `'s format` đứng ngay sau nó.
  - Lần xuất hiện đầu tiên của chuỗi văn bản bắt đầu bằng `attributes` và kết thúc bằng `attribute`, có prefix là `Deprecated`.

Nếu bạn không thấy một hoặc nhiều text fragment của mình được tô sáng và bạn chắc chắn rằng cú pháp của mình đúng, có thể bạn chỉ đang tô sáng một trường hợp khác với trường hợp bạn mong đợi. Nó vẫn có thể được tô sáng, nhưng nằm ngoài màn hình.

### Tạo kiểu cho các text fragment khớp

Trình duyệt được phép áp dụng kiểu cho văn bản được tô sáng theo cách mặc định mà họ chọn. [CSS Pseudo-Elements Module Level 4](https://drafts.csswg.org/css-pseudo/#selectordef-target-text) định nghĩa một pseudo-element, {{cssxref("::target-text")}}, cho phép bạn chỉ định kiểu tùy chỉnh.

Ví dụ, trong [bản demo scroll-to-text](https://mdn.github.io/css-examples/target-text/index.html#:~:text=From%20the%20foregoing%20remarks%20we%20may%20gather%20an%20idea%20of%20the%20importance) của chúng tôi, chúng tôi có CSS sau:

```css
::target-text {
  background-color: rebeccapurple;
  color: white;
}
```

Hãy thử theo liên kết ở trên trong một trình duyệt được hỗ trợ để xem hiệu ứng này.

### Khả năng phát hiện tính năng

Đối tượng {{domxref("FragmentDirective")}}, được truy cập thông qua thuộc tính {{domxref("Document.fragmentDirective")}}, có thể được dùng để kiểm tra xem trình duyệt có hỗ trợ text fragments hay không.

Hãy thử chạy đoạn sau trong công cụ devtools của một trình duyệt được hỗ trợ, trong một tab có một hoặc nhiều text fragment khớp:

```js
document.fragmentDirective;
// trả về một đối tượng FragmentDirective rỗng, nếu được hỗ trợ
// ngược lại là undefined
```

Chức năng này hiện chủ yếu nhằm phục vụ việc phát hiện tính năng. Trong tương lai, đối tượng `FragmentDirective` có thể chứa thêm thông tin.

## Tham khảo

### API

- {{domxref("FragmentDirective")}}
  - : Một đối tượng biểu diễn các text fragment. Hiện tại nó rỗng và chủ yếu nhằm phục vụ việc phát hiện tính năng.
- {{domxref("Document.fragmentDirective")}}
  - : Trả về {{domxref("FragmentDirective")}} cho tài liệu hiện tại.

### CSS

- {{cssxref("::target-text")}}
  - : Đại diện cho các text fragment được tô sáng trong tài liệu hiện tại. Nó cho phép tác giả tùy chỉnh kiểu của text fragment.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Boldly link where no one has linked before: Text Fragments](https://web.dev/articles/text-fragments)
