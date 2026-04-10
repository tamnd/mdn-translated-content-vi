---
title: "Document: phương thức execCommand()"
short-title: execCommand()
slug: Web/API/Document/execCommand
page-type: web-api-instance-method
status:
  - deprecated
browser-compat: api.Document.execCommand
---

{{ApiRef("DOM")}}{{deprecated_header}}

> [!NOTE]
> Mặc dù phương thức `execCommand()` đã lỗi thời, vẫn có một số trường hợp sử dụng hợp lệ chưa có giải pháp thay thế khả thi. Ví dụ, không giống như thao tác DOM trực tiếp, các sửa đổi được thực hiện bởi `execCommand()` bảo tồn bộ đệm hoàn tác (lịch sử chỉnh sửa). Đối với những trường hợp này, bạn vẫn có thể sử dụng phương thức này, nhưng hãy kiểm tra để đảm bảo tương thích trình duyệt, chẳng hạn bằng cách sử dụng {{domxref("document.queryCommandSupported()")}}.

Phương thức **`execCommand`** triển khai nhiều lệnh khác nhau. Một số lệnh cung cấp quyền truy cập vào clipboard, trong khi số khác dùng để chỉnh sửa [các đầu vào biểu mẫu](/en-US/docs/Web/HTML/Reference/Elements/input), các phần tử [`contenteditable`](/en-US/docs/Web/HTML/Reference/Global_attributes/contenteditable) hoặc toàn bộ tài liệu (khi chuyển sang [chế độ thiết kế](/en-US/docs/Web/API/Document/designMode)).

Để truy cập clipboard, [Clipboard API](/en-US/docs/Web/API/Clipboard_API) mới hơn được khuyến nghị thay vì `execCommand()`.

Hầu hết các lệnh ảnh hưởng đến [vùng chọn](/en-US/docs/Web/API/Selection) của tài liệu. Ví dụ, một số lệnh (in đậm, in nghiêng, v.v.) định dạng văn bản hiện đang được chọn, trong khi những lệnh khác xóa vùng chọn, chèn phần tử mới (thay thế vùng chọn) hoặc ảnh hưởng đến toàn bộ dòng (thụt lề). Chỉ phần tử chỉnh sửa đang hoạt động mới có thể được sửa đổi, nhưng một số lệnh (ví dụ: `copy`) có thể hoạt động mà không cần phần tử chỉnh sửa.

> [!NOTE]
> Các sửa đổi được thực hiện bởi `execCommand()` có thể kích hoạt hoặc không kích hoạt các sự kiện {{domxref("Element/beforeinput_event", "beforeinput")}} và {{domxref("Element/input_event", "input")}}, tùy thuộc vào trình duyệt và cấu hình. Nếu được kích hoạt, trình xử lý sự kiện sẽ chạy trước khi `execCommand()` trả về. Tác giả cần cẩn thận với các lệnh gọi đệ quy như vậy, đặc biệt nếu họ gọi `execCommand()` để phản hồi các sự kiện này. Từ Firefox 82, các lệnh gọi `execCommand()` lồng nhau sẽ luôn thất bại, xem [bug 1634262](https://bugzil.la/1634262).

## Cú pháp

```js-nolint
execCommand(commandName, showDefaultUI, valueArgument)
```

### Tham số

- `commandName`
  - : Một chuỗi chỉ định tên lệnh cần thực thi. Các lệnh sau được chỉ định:
    - `backColor`
      - : Thay đổi màu nền tài liệu. Trong chế độ `styleWithCss`, nó thay vào đó ảnh hưởng đến màu nền của khối chứa. Điều này yêu cầu truyền một chuỗi giá trị {{cssxref("&lt;color&gt;")}} làm đối số giá trị.
    - `bold`
      - : Bật/tắt in đậm cho vùng chọn hoặc tại điểm chèn.
    - `contentReadOnly`
      - : Làm cho tài liệu nội dung chỉ đọc hoặc có thể chỉnh sửa. Điều này yêu cầu một boolean true/false làm đối số giá trị.
    - `copy`
      - : Sao chép vùng chọn hiện tại vào clipboard. Điều kiện để bật hành vi này khác nhau giữa các trình duyệt và đã thay đổi theo thời gian. Kiểm tra bảng tương thích để xác định xem bạn có thể sử dụng nó trong trường hợp của mình không.
    - `createLink`
      - : Tạo một siêu liên kết từ vùng chọn, nhưng chỉ khi có vùng chọn. Yêu cầu một chuỗi {{Glossary("URI")}} làm đối số giá trị cho `href` của siêu liên kết. URI phải chứa ít nhất một ký tự, có thể là khoảng trắng.
    - `cut`
      - : Xóa vùng chọn hiện tại và sao chép vào clipboard. Thời điểm bật hành vi này khác nhau giữa các trình duyệt và điều kiện đã thay đổi theo thời gian. Kiểm tra [bảng tương thích](#browser_compatibility) để biết chi tiết sử dụng.
    - `decreaseFontSize`
      - : Thêm thẻ {{HTMLElement("small")}} xung quanh vùng chọn hoặc tại điểm chèn.
    - `defaultParagraphSeparator`
      - : Thay đổi dấu phân cách đoạn văn được sử dụng khi đoạn văn mới được tạo trong vùng văn bản chỉnh sửa.
    - `delete`
      - : Xóa vùng chọn hiện tại.
    - `enableAbsolutePositionEditor`
      - : Bật hoặc tắt grabber cho phép các phần tử định vị tuyệt đối được di chuyển. Grabber bị tắt theo mặc định từ Firefox 64 ([Firefox bug 1490641](https://bugzil.la/1490641)).
    - `enableInlineTableEditing`
      - : Bật hoặc tắt các điều khiển chèn/xóa hàng/cột bảng. Các điều khiển bị tắt theo mặc định từ Firefox 64 ([Firefox bug 1490641](https://bugzil.la/1490641)).
    - `enableObjectResizing`
      - : Bật hoặc tắt các tay cầm thay đổi kích thước trên hình ảnh, bảng và các phần tử định vị tuyệt đối cùng các đối tượng có thể thay đổi kích thước khác. Các tay cầm bị tắt theo mặc định từ Firefox 64 ([Firefox bug 1490641](https://bugzil.la/1490641)).
    - `fontName`
      - : Thay đổi tên phông chữ cho vùng chọn hoặc tại điểm chèn. Yêu cầu một chuỗi tên phông chữ (như `"Arial"`) làm đối số giá trị.
    - `fontSize`
      - : Thay đổi kích thước phông chữ cho vùng chọn hoặc tại điểm chèn. Yêu cầu một số nguyên từ `1` - `7` làm đối số giá trị.
    - `foreColor`
      - : Thay đổi màu phông chữ cho vùng chọn hoặc tại điểm chèn. Yêu cầu một chuỗi giá trị màu thập lục phân làm đối số giá trị.
    - `formatBlock`
      - : Thêm một phần tử HTML khối xung quanh dòng chứa vùng chọn hiện tại, thay thế phần tử khối chứa dòng nếu có (trong Firefox, {{HTMLElement("blockquote")}} là ngoại lệ — nó sẽ bao quanh bất kỳ phần tử khối nào). Yêu cầu một chuỗi tên thẻ làm đối số giá trị. Hầu hết mọi phần tử khối đều có thể được sử dụng. (Legacy Edge chỉ hỗ trợ các thẻ tiêu đề `H1` – `H6`, `ADDRESS` và `PRE`, phải được bao quanh bởi dấu ngoặc nhọn, chẳng hạn `"<H1>"`.)
    - `forwardDelete`
      - : Xóa ký tự phía trước vị trí [con trỏ](https://en.wikipedia.org/wiki/Cursor_%28computers%29), giống như nhấn phím Delete trên bàn phím Windows.
    - `heading`
      - : Thêm một phần tử tiêu đề xung quanh vùng chọn hoặc dòng điểm chèn. Yêu cầu chuỗi tên thẻ làm đối số giá trị (tức là `"H1"`, `"H6"`). (Không được Safari hỗ trợ.)
    - `highlightColor`
      - : Thay đổi màu nền cho vùng chọn hoặc tại điểm chèn. Yêu cầu chuỗi giá trị màu làm đối số giá trị. `useCSS` phải là `true` để tính năng này hoạt động.
    - `increaseFontSize`
      - : Thêm thẻ {{HTMLElement("big")}} xung quanh vùng chọn hoặc tại điểm chèn.
    - `indent`
      - : Thụt lề dòng chứa vùng chọn hoặc điểm chèn. Trong Firefox, nếu vùng chọn bao gồm nhiều dòng ở các mức thụt lề khác nhau, chỉ các dòng ít thụt lề nhất trong vùng chọn sẽ được thụt lề.
    - `insertBrOnReturn`
      - : Kiểm soát xem phím Enter có chèn phần tử {{HTMLElement("br")}} hay tách phần tử khối hiện tại thành hai.
    - `insertHorizontalRule`
      - : Chèn phần tử {{HTMLElement("hr")}} tại điểm chèn, hoặc thay thế vùng chọn bằng nó.
    - `insertHTML`
      - : Chèn một instance {{domxref("TrustedHTML")}} hoặc chuỗi HTML tại điểm chèn (xóa vùng chọn).
        Điều này yêu cầu đánh dấu HTML hợp lệ.

        > [!WARNING]
        > Đầu vào được phân tích cú pháp dưới dạng HTML và ghi vào DOM.
        > Các API như vậy được gọi là [injection sinks](/en-US/docs/Web/API/Trusted_Types_API#concepts_and_usage), và có thể là vector cho các cuộc tấn công [cross-site scripting (XSS)](/en-US/docs/Web/Security/Attacks/XSS), nếu đầu vào ban đầu đến từ kẻ tấn công.
        >
        > Bạn có thể giảm thiểu rủi ro này bằng cách luôn gán các đối tượng {{domxref("TrustedHTML")}} thay vì chuỗi và [enforcing trusted types](/en-US/docs/Web/API/Trusted_Types_API#using_a_csp_to_enforce_trusted_types).
        > Xem [Trusted Types API](/en-US/docs/Web/API/Trusted_Types_API) để biết thêm thông tin.

    - `insertImage`
      - : Chèn hình ảnh tại điểm chèn (xóa vùng chọn). Yêu cầu chuỗi URL cho `src` của hình ảnh làm đối số giá trị. Yêu cầu cho chuỗi này giống như `createLink`.
    - `insertOrderedList`
      - : Tạo một [danh sách có thứ tự được đánh số](/en-US/docs/Web/HTML/Reference/Elements/ol) cho vùng chọn hoặc tại điểm chèn.
    - `insertUnorderedList`
      - : Tạo một [danh sách không thứ tự có dấu đầu dòng](/en-US/docs/Web/HTML/Reference/Elements/ul) cho vùng chọn hoặc tại điểm chèn.
    - `insertParagraph`
      - : Chèn một [đoạn văn](/en-US/docs/Web/HTML/Reference/Elements/p) xung quanh vùng chọn hoặc dòng hiện tại.
    - `insertText`
      - : Chèn văn bản thuần túy đã cho tại điểm chèn (xóa vùng chọn).
    - `italic`
      - : Bật/tắt in nghiêng cho vùng chọn hoặc tại điểm chèn.
    - `justifyCenter`
      - : Căn giữa vùng chọn hoặc điểm chèn.
    - `justifyFull`
      - : Căn đều vùng chọn hoặc điểm chèn.
    - `justifyLeft`
      - : Căn trái vùng chọn hoặc điểm chèn.
    - `justifyRight`
      - : Căn phải vùng chọn hoặc điểm chèn.
    - `outdent`
      - : Giảm thụt lề dòng chứa vùng chọn hoặc điểm chèn.
    - `paste`
      - : Dán nội dung clipboard tại điểm chèn (thay thế vùng chọn hiện tại).

        Tính năng này được chỉ định là bị vô hiệu hóa cho _nội dung web_, nhưng đã được triển khai thông qua [Clipboard API](/en-US/docs/Web/API/Clipboard_API#security_considerations) trên một số trình duyệt.
        Trên các trình duyệt này, tính năng yêu cầu {{glossary("transient activation")}} và xác nhận giao diện người dùng popup khi dán nội dung cross-origin.
        Xem [bảng tương thích trình duyệt](#browser_compatibility) để biết thêm thông tin.

    - `redo`
      - : Làm lại lệnh hoàn tác trước đó.
    - `removeFormat`
      - : Xóa tất cả định dạng khỏi vùng chọn hiện tại.
    - `selectAll`
      - : Chọn tất cả nội dung của vùng chỉnh sửa.
    - `strikeThrough`
      - : Bật/tắt gạch ngang cho vùng chọn hoặc tại điểm chèn.
    - `subscript`
      - : Bật/tắt [chỉ số dưới](/en-US/docs/Web/HTML/Reference/Elements/sub) cho vùng chọn hoặc tại điểm chèn.
    - `superscript`
      - : Bật/tắt [chỉ số trên](/en-US/docs/Web/HTML/Reference/Elements/sup) cho vùng chọn hoặc tại điểm chèn.
    - `underline`
      - : Bật/tắt [gạch chân](/en-US/docs/Web/HTML/Reference/Elements/u) cho vùng chọn hoặc tại điểm chèn.
    - `undo`
      - : Hoàn tác lệnh đã thực thi cuối cùng.
    - `unlink`
      - : Xóa [phần tử neo](/en-US/docs/Web/HTML/Reference/Elements/a) khỏi siêu liên kết đã chọn.
    - `useCSS` {{Deprecated_inline}}
      - : Bật/tắt việc sử dụng thẻ HTML hoặc CSS cho đánh dấu đã tạo. Yêu cầu boolean true/false làm đối số giá trị.
        > [!NOTE]
        > Đối số này ngược về mặt logic (tức là sử dụng `false` để dùng CSS,
        > `true` để dùng HTML). Điều này đã bị loại bỏ để ủng hộ `styleWithCSS`.
    - `styleWithCSS`
      - : Thay thế lệnh `useCSS`. `true` sửa đổi/tạo thuộc tính `style` trong đánh dấu, false tạo các phần tử trình bày.
    - `AutoUrlDetect`
      - : Thay đổi hành vi tự động liên kết của trình duyệt.

- `showDefaultUI`
  - : Một giá trị boolean cho biết có hiển thị giao diện người dùng mặc định hay không. Tính năng này không được triển khai trong Mozilla.
- `valueArgument`
  - : Đối với các lệnh yêu cầu đối số đầu vào, là một chuỗi cung cấp thông tin đó. Ví dụ: `insertImage` yêu cầu URL của hình ảnh cần chèn. Chỉ định `null` nếu không cần đối số.

### Giá trị trả về

Một giá trị boolean là `false` nếu lệnh không được hỗ trợ hoặc bị vô hiệu hóa.

> [!NOTE]
> `document.execCommand()` chỉ trả về
> `true` nếu nó được gọi như một phần của tương tác người dùng. Bạn không thể sử dụng nó để
> xác minh hỗ trợ trình duyệt trước khi gọi lệnh.

## Ví dụ

### Sử dụng insertText

Ví dụ này hiển thị hai trình chỉnh sửa HTML rất cơ bản, một sử dụng phần tử {{HTMLElement("textarea")}} và một sử dụng phần tử {{HTMLElement("pre")}} với thuộc tính [`contenteditable`](/en-US/docs/Web/HTML/Reference/Global_attributes/contenteditable).

Nhấp vào nút "In đậm" hoặc "In nghiêng" sẽ chèn thẻ thích hợp vào phần tử, sử dụng `insertText` để bảo tồn lịch sử chỉnh sửa, để người dùng có thể hoàn tác hành động.

#### HTML

```html
<h2>textarea</h2>

<div class="actions" data-for="textarea">
  <button data-el="b">In đậm</button>
  <button data-el="i">In nghiêng</button>
</div>

<textarea class="editarea">Some text.</textarea>

<h2>contenteditable</h2>

<div class="actions" data-for="pre">
  <button data-el="b">In đậm</button>
  <button data-el="i">In nghiêng</button>
</div>

<pre contenteditable="true" class="editarea">Some text.</pre>
```

#### JavaScript

```js
// Chuẩn bị các nút hành động
const buttonContainers = document.querySelectorAll(".actions");

for (const buttonContainer of buttonContainers) {
  const buttons = buttonContainer.querySelectorAll("button");
  const pasteTarget = buttonContainer.getAttribute("data-for");

  for (const button of buttons) {
    const elementName = button.getAttribute("data-el");
    button.addEventListener("click", () =>
      insertText(`<${elementName}></${elementName}>`, pasteTarget),
    );
  }
}

// Chèn văn bản tại con trỏ, hoặc thay thế văn bản đã chọn
function insertText(newText, selector) {
  const textarea = document.querySelector(selector);
  textarea.focus();

  let pasted = true;
  try {
    if (!document.execCommand("insertText", false, newText)) {
      pasted = false;
    }
  } catch (e) {
    console.error("error caught:", e);
    pasted = false;
  }

  if (!pasted) {
    console.error("paste unsuccessful, execCommand not supported");
  }
}
```

#### Kết quả

{{EmbedLiveSample("Using insertText", 100, 300)}}

### Sử dụng paste

Ví dụ này có một phần tử {{HTMLElement("textarea")}} và một phần tử {{HTMLElement("button")}} mà bạn có thể sử dụng để dán nội dung vào đó.

#### HTML

```html
<button id="paste">Dán</button>
<hr />
<textarea id="text_box">Some text.</textarea>
```

#### JavaScript

```js
const pasteButton = document.querySelector("#paste");
const textBox = document.querySelector("#text_box");

pasteButton.addEventListener("click", () => {
  textBox.focus();

  let pasted = document.execCommand("paste", false);
  if (!pasted) {
    textBox.textContent = "dán không thành công, execCommand không được hỗ trợ";
  }
});
```

#### Kết quả

Trên các trình duyệt triển khai tính năng này bằng [Clipboard API](/en-US/docs/Web/API/Clipboard_API#security_considerations), bạn có thể sao chép nội dung cùng nguồn gốc, chẳng hạn văn bản từ vùng văn bản, và sau đó dán để thay thế bất kỳ nội dung nào đã chọn.
Khi bạn cố dán nội dung cross-origin, chẳng hạn văn bản được sao chép từ bất kỳ trang hoặc vị trí nào khác, trước tiên bạn cần chọn giao diện người dùng "Dán" được hiển thị.

{{EmbedLiveSample("Using paste", 100, 300)}}

## Đặc tả kỹ thuật

Tính năng này không thuộc bất kỳ đặc tả kỹ thuật hiện tại nào. Nó không còn nằm trong lộ trình trở thành tiêu chuẩn. Có một [bản nháp đặc tả W3C execCommand không chính thức](https://w3c.github.io/editing/docs/execCommand/).

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Clipboard API](/en-US/docs/Web/API/Clipboard_API)
- Ví dụ MDN: [execCommands được hỗ trợ trong trình duyệt của bạn](https://mdn.github.io/dom-examples/execcommand/)
- {{domxref("HTMLElement.contentEditable")}}
- {{domxref("document.designMode")}}
- {{domxref("document.queryCommandEnabled()")}}
- {{domxref("document.queryCommandState()")}}
- {{domxref("document.queryCommandSupported()")}}
