---
title: Selection
slug: Web/API/Selection
page-type: web-api-interface
browser-compat: api.Selection
---

{{ApiRef("Selection API")}}

Một đối tượng **`Selection`** đại diện cho phạm vi văn bản được người dùng chọn hoặc vị trí hiện tại của con trỏ chèn văn bản. Mỗi {{domxref("document")}} được liên kết với một đối tượng selection duy nhất, có thể lấy bằng {{DOMxRef("document.getSelection()")}} hoặc {{domxref("window.getSelection()")}}, rồi sau đó kiểm tra và chỉnh sửa.

Người dùng có thể tạo vùng chọn từ trái sang phải (theo thứ tự tài liệu) hoặc từ phải sang trái (ngược thứ tự tài liệu). **_Anchor_** là nơi người dùng bắt đầu vùng chọn và **_focus_** là nơi người dùng kết thúc vùng chọn. Nếu bạn chọn văn bản bằng chuột trên máy tính, anchor nằm ở vị trí bạn nhấn nút chuột và focus nằm ở vị trí bạn thả nút chuột.

> [!NOTE]
> _Anchor_ và _focus_ không nên nhầm với các vị trí _start_ và _end_ của một vùng chọn. Anchor có thể nằm trước focus hoặc ngược lại, tùy theo hướng bạn tạo vùng chọn.

## Thuộc tính thể hiện

- {{DOMxRef("Selection.anchorNode")}} {{ReadOnlyInline}}
  - : Trả về {{DOMxRef("Node")}} mà tại đó vùng chọn bắt đầu. Có thể trả về `null` nếu vùng chọn chưa từng tồn tại trong tài liệu (ví dụ, một iframe chưa từng được bấm vào, hoặc nút thuộc về một cây tài liệu khác).
- {{DOMxRef("Selection.anchorOffset")}} {{ReadOnlyInline}}
  - : Trả về một số biểu thị độ lệch của anchor của vùng chọn trong `anchorNode`. Nếu `anchorNode` là nút văn bản, đây là số ký tự trong `anchorNode` nằm trước anchor. Nếu `anchorNode` là phần tử, đây là số nút con của `anchorNode` nằm trước anchor.
- {{DOMxRef("Selection.direction")}} {{ReadOnlyInline}}
  - : Một chuỗi mô tả hướng của vùng chọn hiện tại.
- {{DOMxRef("Selection.focusNode")}} {{ReadOnlyInline}}
  - : Trả về {{DOMxRef("Node")}} mà tại đó vùng chọn kết thúc. Có thể trả về `null` nếu vùng chọn chưa từng tồn tại trong tài liệu (ví dụ, một iframe chưa từng được bấm vào, hoặc nút thuộc về một cây tài liệu khác).
- {{DOMxRef("Selection.focusOffset")}} {{ReadOnlyInline}}
  - : Trả về một số biểu thị độ lệch của focus của vùng chọn trong `focusNode`. Nếu `focusNode` là nút văn bản, đây là số ký tự trong `focusNode` nằm trước focus. Nếu `focusNode` là phần tử, đây là số nút con của `focusNode` nằm trước focus.
- {{DOMxRef("Selection.isCollapsed")}} {{ReadOnlyInline}}
  - : Trả về giá trị Boolean cho biết điểm bắt đầu và điểm kết thúc của vùng chọn có nằm ở cùng một vị trí hay không.
- {{DOMxRef("Selection.rangeCount")}} {{ReadOnlyInline}}
  - : Trả về số lượng range trong vùng chọn.
- {{DOMxRef("Selection.type")}} {{ReadOnlyInline}}
  - : Trả về một chuỗi mô tả kiểu của vùng chọn hiện tại.

## Phương thức thể hiện

- {{DOMxRef("Selection.addRange()")}}
  - : Một đối tượng {{DOMxRef("Range")}} sẽ được thêm vào vùng chọn.
- {{DOMxRef("Selection.collapse()")}}
  - : Thu gọn vùng chọn hiện tại về một điểm duy nhất.
- {{DOMxRef("Selection.collapseToEnd()")}}
  - : Thu gọn vùng chọn về cuối của range cuối cùng trong vùng chọn.
- {{DOMxRef("Selection.collapseToStart()")}}
  - : Thu gọn vùng chọn về đầu của range đầu tiên trong vùng chọn.
- {{DOMxRef("Selection.containsNode()")}}
  - : Cho biết một nút cụ thể có nằm trong vùng chọn hay không.
- {{DOMxRef("Selection.deleteFromDocument()")}}
  - : Xóa nội dung của vùng chọn khỏi tài liệu.
- {{DOMxRef("Selection.empty()")}}
  - : Xóa tất cả các range khỏi vùng chọn, để các thuộc tính {{domxref("Selection.anchorNode", "anchorNode")}} và {{domxref("Selection.focusNode","focusNode")}} bằng `null` và không còn gì được chọn.
- {{DOMxRef("Selection.extend()")}}
  - : Di chuyển focus của vùng chọn tới một điểm đã chỉ định.
- {{DOMxRef("Selection.getComposedRanges()")}}
  - : Trả về một mảng các đối tượng {{domxref("StaticRange")}}, mỗi đối tượng đại diện cho một vùng chọn có thể cắt qua ranh giới shadow DOM.
- {{DOMxRef("Selection.getRangeAt()")}}
  - : Trả về một đối tượng {{domxref("Range")}} đại diện cho một trong các range đang được chọn.
- {{DOMxRef("Selection.modify()")}}
  - : Thay đổi vùng chọn hiện tại.
- {{DOMxRef("Selection.removeRange()")}}
  - : Xóa một range khỏi vùng chọn.
- {{DOMxRef("Selection.removeAllRanges()")}}
  - : Xóa tất cả các range khỏi vùng chọn.
- {{DOMxRef("Selection.selectAllChildren()")}}
  - : Thêm tất cả phần tử con của nút đã chỉ định vào vùng chọn.
- {{DOMxRef("Selection.setBaseAndExtent()")}}
  - : Đặt vùng chọn thành một range bao gồm toàn bộ hoặc một phần của hai nút DOM đã chỉ định, cùng với toàn bộ nội dung nằm giữa chúng.
- {{DOMxRef("Selection.setPosition()")}}
  - : Thu gọn vùng chọn hiện tại về một điểm duy nhất.
- {{DOMxRef("Selection.toString()")}}
  - : Trả về chuỗi hiện đang được đối tượng selection biểu diễn, tức là văn bản hiện được chọn.

## Ghi chú

### Biểu diễn chuỗi của một vùng chọn

Gọi phương thức {{DOMxRef("Selection.toString()")}} sẽ trả về văn bản nằm trong vùng chọn, ví dụ:

```js
const selObj = window.getSelection();
window.alert(selObj);
```

Lưu ý rằng khi truyền một đối tượng selection làm đối số cho `window.alert`, hàm sẽ gọi phương thức `toString` của đối tượng.

### Nhiều range trong một vùng chọn

Đối tượng selection đại diện cho các {{DOMxRef("Range")}} mà người dùng đã chọn. Thông thường, nó chỉ giữ một range, được truy cập như sau:

```js
const selObj = window.getSelection();
const range = selObj.getRangeAt(0);
```

- `selObj` là một đối tượng Selection
- `range` là một đối tượng {{DOMxRef("Range")}}

Theo [ghi chú của đặc tả Selection API](https://w3c.github.io/selection-api/#h-note-13), Selection API ban đầu được Netscape tạo ra và cho phép nhiều range (ví dụ để người dùng có thể chọn một cột từ {{HTMLElement("table")}}). Tuy nhiên, các trình duyệt ngoài Gecko không triển khai nhiều range, và đặc tả cũng yêu cầu vùng chọn luôn chỉ có một range.

### Selection và focus của input

Selection và focus của input (được biểu thị bởi {{DOMxRef("Document.activeElement")}}) có một mối quan hệ phức tạp thay đổi theo từng trình duyệt. Trong mã tương thích đa trình duyệt, tốt hơn là xử lý chúng riêng biệt.

Safari và Chrome (không giống Firefox) hiện sẽ focus phần tử chứa vùng chọn khi vùng chọn bị thay đổi bằng lập trình; điều này có thể thay đổi trong tương lai (xem [W3C bug 14383](https://www.w3.org/Bugs/Public/show_bug.cgi?id=14383) và [WebKit bug 38696](https://webkit.org/b/38696)).

### Hành vi của Selection API liên quan đến thay đổi focus của editing host

Selection API có một hành vi chung (tức là được chia sẻ giữa các trình duyệt) điều khiển cách focus thay đổi đối với _editing host_ sau khi một số phương thức được gọi.

Hành vi như sau:

1. Một editing host nhận focus nếu vùng chọn trước đó nằm ngoài nó.
2. Một phương thức Selection API được gọi, tạo ra một vùng chọn mới với phạm vi nằm trong editing host.
3. Sau đó focus chuyển tới editing host.

> [!NOTE]
> Các phương thức Selection API chỉ có thể chuyển focus tới editing host, không phải tới các phần tử có thể focus khác (ví dụ, {{HTMLElement("a")}}).

Hành vi trên áp dụng cho các vùng chọn được tạo bằng các phương thức sau:

- {{DOMxRef("Selection.collapse()")}}
- {{DOMxRef("Selection.collapseToStart()")}}
- {{DOMxRef("Selection.collapseToEnd()")}}
- {{DOMxRef("Selection.extend()")}}
- {{DOMxRef("Selection.selectAllChildren()")}}
- {{DOMxRef("Selection.addRange()")}}
- {{DOMxRef("Selection.setBaseAndExtent()")}}

Và khi {{DOMxRef("Range")}} được chỉnh sửa bằng các phương thức sau:

- {{DOMxRef("Range.setStart()")}}
- {{DOMxRef("Range.setEnd()")}}
- {{DOMxRef("Range.setStartBefore()")}}
- {{DOMxRef("Range.setStartAfter()")}}
- {{DOMxRef("Range.setEndBefore()")}}
- {{DOMxRef("Range.setEndAfter()")}}
- {{DOMxRef("Range.collapse()")}}
- {{DOMxRef("Range.selectNode()")}}
- {{DOMxRef("Range.selectNodeContents()")}}

### Thuật ngữ

Các thuật ngữ chính khác được dùng trong phần này.

- anchor
  - : Anchor của một vùng chọn là điểm bắt đầu của vùng chọn. Khi chọn bằng chuột, anchor là vị trí trong tài liệu nơi nút chuột được nhấn lần đầu. Khi người dùng thay đổi vùng chọn bằng chuột hoặc bàn phím, anchor không di chuyển.
- editing host
  - : Một phần tử có thể chỉnh sửa (ví dụ, một phần tử HTML có đặt [`contenteditable`](/en-US/docs/Web/HTML/Reference/Global_attributes/contenteditable), hoặc phần tử HTML con của một tài liệu có bật {{DOMxRef("Document.designMode", "designMode")}}).
- focus of a selection
  - : _Focus_ của một vùng chọn là điểm kết thúc của vùng chọn. Khi chọn bằng chuột, focus là vị trí trong tài liệu nơi nút chuột được thả ra. Khi người dùng thay đổi vùng chọn bằng chuột hoặc bàn phím, focus là đầu vùng chọn đang di chuyển.

    > [!NOTE]
    > Đây không phải là phần tử _focused_ của tài liệu, như được trả về bởi {{DOMxRef("document.activeElement")}}.

- range
  - : Một _range_ là một phần liên tục của tài liệu. Một range có thể chứa toàn bộ nút cũng như một phần của nút (ví dụ một phần của nút văn bản). Thông thường người dùng chỉ chọn một range tại một thời điểm, nhưng cũng có thể chọn nhiều range (ví dụ bằng cách dùng phím <kbd>Control</kbd>). Có thể lấy một range từ vùng chọn dưới dạng đối tượng {{DOMxRef("range")}}. Các đối tượng Range cũng có thể được tạo qua DOM và thêm hoặc xóa khỏi vùng chọn bằng lập trình.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{DOMxRef("Window.getSelection")}}, {{DOMxRef("Document.getSelection")}}, {{DOMxRef("Range")}}
- Các sự kiện liên quan đến Selection: {{domxref("Document/selectionchange_event", "selectionchange")}} và {{domxref("Node/selectstart_event", "selectstart")}}
- Các input HTML cung cấp API trợ giúp đơn giản hơn để làm việc với vùng chọn (xem {{DOMxRef("HTMLInputElement.setSelectionRange()")}})
- {{DOMxRef("Document.activeElement")}}, {{DOMxRef("HTMLElement.focus")}}, và {{DOMxRef("HTMLElement.blur")}}
