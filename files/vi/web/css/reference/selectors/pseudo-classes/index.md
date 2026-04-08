---
title: Pseudo-classes
slug: Web/CSS/Reference/Selectors/Pseudo-classes
page-type: landing-page
spec-urls:
  - https://html.spec.whatwg.org/multipage/semantics-other.html#pseudo-classes
  - https://drafts.csswg.org/selectors/
  - https://drafts.csswg.org/css-scoping/
  - https://drafts.csswg.org/css-page/
sidebar: cssref
---

**_Pseudo-class_** trong [CSS](/en-US/docs/Web/CSS) là một từ khóa được thêm vào bộ chọn, cho phép bạn chọn các phần tử dựa trên thông tin nằm ngoài cây tài liệu, chẳng hạn như trạng thái cụ thể của các phần tử được chọn. Ví dụ, pseudo-class {{CSSxRef(":hover")}} có thể được dùng để tạo kiểu cho một nút khi con trỏ của người dùng di chuột qua nó.

```css
/* Any button over which the user's pointer is hovering */
button:hover {
  color: blue;
}
```

Một pseudo-class bao gồm dấu hai chấm (`:`) theo sau là tên pseudo-class (ví dụ: `:hover`). Pseudo-class hàm cũng chứa một cặp dấu ngoặc đơn để xác định các đối số (ví dụ: `:dir()`). Phần tử mà một pseudo-class được gắn vào được định nghĩa là _phần tử neo_ (ví dụ: `button` trong trường hợp `button:hover`).

Pseudo-class cho phép bạn áp dụng kiểu cho một phần tử không chỉ liên quan đến nội dung của cây tài liệu, mà còn liên quan đến các yếu tố bên ngoài như lịch sử duyệt web ({{CSSxRef(":visited")}}, chẳng hạn), trạng thái nội dung của nó (như {{CSSxRef(":checked")}} trên một số phần tử biểu mẫu), hoặc vị trí của chuột (như {{CSSxRef(":hover")}}, cho phép biết liệu chuột có đang ở trên phần tử hay không).

> [!NOTE]
> Khác với pseudo-class, [pseudo-element](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-elements) có thể được dùng để tạo kiểu cho _một phần cụ thể_ của phần tử.

## Pseudo-class nhận dạng phần tử

Các pseudo-class này liên quan đến danh tính cốt lõi của các phần tử.

- {{CSSxRef(":defined")}}
  - : Khớp với bất kỳ phần tử nào đã được định nghĩa.
- {{CSSxRef(":heading")}}
  - : Khớp với bất kỳ phần tử tiêu đề nào (`<h1>`-`<h6>`).

## Pseudo-class trạng thái hiển thị phần tử

Các pseudo-class này cho phép chọn phần tử dựa trên trạng thái hiển thị của chúng.

- {{CSSxRef(":open")}}
  - : Khớp với phần tử có thể mở hoặc đóng, hiện đang ở trạng thái mở.
- {{CSSxRef(":popover-open")}}
  - : Khớp với phần tử popover hiện đang trong trạng thái hiển thị.
- {{CSSxRef(":modal")}}
  - : Khớp với phần tử đang ở trạng thái loại trừ mọi tương tác với các phần tử bên ngoài nó cho đến khi tương tác đó bị đóng.
- {{CSSxRef(":fullscreen")}}
  - : Khớp với phần tử hiện đang ở chế độ toàn màn hình.
- {{CSSxRef(":picture-in-picture")}}
  - : Khớp với phần tử hiện đang ở chế độ picture-in-picture.

## Pseudo-class đầu vào

Các pseudo-class này liên quan đến các phần tử biểu mẫu và cho phép chọn phần tử dựa trên thuộc tính HTML và trạng thái của trường trước và sau khi tương tác.

- {{CSSxRef(":enabled")}}
  - : Đại diện cho phần tử giao diện người dùng đang ở trạng thái bật.
- {{CSSxRef(":disabled")}}
  - : Đại diện cho phần tử giao diện người dùng đang ở trạng thái tắt.
- {{CSSxRef(":read-only")}}
  - : Đại diện cho bất kỳ phần tử nào không thể được người dùng thay đổi.
- {{CSSxRef(":read-write")}}
  - : Đại diện cho bất kỳ phần tử nào có thể chỉnh sửa bởi người dùng.
- {{CSSxRef(":placeholder-shown")}}
  - : Khớp với phần tử input đang hiển thị văn bản placeholder. Ví dụ: nó sẽ khớp với thuộc tính `placeholder` trong các phần tử {{htmlelement("input")}} và {{htmlelement("textarea")}}.
- {{CSSxRef(":autofill")}}
  - : Khớp khi một {{htmlelement("input")}} đã được trình duyệt tự động điền.
- {{CSSxRef(":default")}}
  - : Khớp với một hoặc nhiều phần tử UI là mặc định trong một tập hợp các phần tử.
- {{CSSxRef(":checked")}}
  - : Khớp khi các phần tử như checkbox và radio button được bật.
- {{CSSxRef(":indeterminate")}}
  - : Khớp với các phần tử UI khi chúng đang ở trạng thái không xác định.
- {{CSSxRef(":blank")}}
  - : Khớp với phần tử nhập liệu của người dùng trống, chứa chuỗi rỗng hoặc đầu vào null khác.
- {{CSSxRef(":valid")}}
  - : Khớp với phần tử có nội dung hợp lệ. Ví dụ: phần tử input có kiểu 'email' chứa địa chỉ email được định dạng hợp lệ hoặc giá trị rỗng nếu điều khiển không bắt buộc.
- {{CSSxRef(":invalid")}}
  - : Khớp với phần tử có nội dung không hợp lệ. Ví dụ: phần tử input có kiểu 'email' với tên được nhập.
- {{CSSxRef(":in-range")}}
  - : Áp dụng cho các phần tử có giới hạn phạm vi. Ví dụ: thanh trượt khi giá trị được chọn nằm trong phạm vi cho phép.
- {{CSSxRef(":out-of-range")}}
  - : Áp dụng cho các phần tử có giới hạn phạm vi. Ví dụ: thanh trượt khi giá trị được chọn nằm ngoài phạm vi cho phép.
- {{CSSxRef(":required")}}
  - : Khớp khi phần tử biểu mẫu là bắt buộc.
- {{CSSxRef(":optional")}}
  - : Khớp khi phần tử biểu mẫu là tùy chọn.
- {{CSSxRef(":user-valid")}}
  - : Đại diện cho phần tử có đầu vào đúng, nhưng chỉ khi người dùng đã tương tác với nó.
- {{CSSxRef(":user-invalid")}}
  - : Đại diện cho phần tử có đầu vào không đúng, nhưng chỉ khi người dùng đã tương tác với nó.

## Pseudo-class ngôn ngữ

Các pseudo-class này phản ánh ngôn ngữ tài liệu và cho phép chọn phần tử dựa trên ngôn ngữ hoặc hướng viết.

- {{cssxref(":dir()")}}
  - : Pseudo-class hướng chọn phần tử dựa trên hướng của nó được xác định bởi ngôn ngữ tài liệu.
- {{cssxref(":lang()")}}
  - : Chọn phần tử dựa trên ngôn ngữ nội dung của nó.

## Pseudo-class vị trí

Các pseudo-class này liên quan đến các liên kết và các phần tử được nhắm đến trong tài liệu hiện tại.

- {{CSSxRef(":any-link")}}
  - : Khớp với phần tử nếu phần tử đó sẽ khớp với {{CSSxRef(":link")}} hoặc {{CSSxRef(":visited")}}.
- {{CSSxRef(":link")}}
  - : Khớp với các liên kết chưa được truy cập.
- {{CSSxRef(":visited")}}
  - : Khớp với các liên kết đã được truy cập.
- {{CSSxRef(":local-link")}}
  - : Khớp với các liên kết có URL tuyệt đối giống với URL đích. Ví dụ: liên kết neo đến cùng một trang.
- {{CSSxRef(":target")}}
  - : Khớp với phần tử là mục tiêu của URL tài liệu.
- {{CSSxRef(":scope")}}
  - : Đại diện cho các phần tử là điểm tham chiếu để các bộ chọn khớp.

> [!NOTE]
> Một pseudo-class `:target-within`, để khớp với các phần tử là hoặc có phần tử con là mục tiêu của URL tài liệu, đã được định nghĩa nhưng bị xóa khỏi thông số kỹ thuật. Hãy dùng `:has(:target)` cho mục đích này.

## Pseudo-class trạng thái tài nguyên

Các pseudo-class này áp dụng cho phương tiện có khả năng ở trạng thái được mô tả là đang phát, chẳng hạn như video.

- {{CSSxRef(":playing")}}
  - : Đại diện cho phần tử có thể phát đang phát.
- {{CSSxRef(":paused")}}
  - : Đại diện cho phần tử có thể phát đang tạm dừng.
- {{CSSxRef(":seeking")}}
  - : Đại diện cho phần tử có thể phát đang tìm kiếm vị trí phát trong tài nguyên phương tiện.
- {{CSSxRef(":buffering")}}
  - : Đại diện cho phần tử có thể phát đang phát nhưng tạm thời bị gián đoạn vì đang tải xuống tài nguyên phương tiện.
- {{CSSxRef(":stalled")}}
  - : Đại diện cho phần tử có thể phát đang phát nhưng bị gián đoạn vì không thể tải xuống tài nguyên phương tiện.
- {{CSSxRef(":muted")}}
  - : Đại diện cho phần tử tạo âm thanh đang bị tắt tiếng.
- {{CSSxRef(":volume-locked")}}
  - : Đại diện cho phần tử tạo âm thanh có mức âm lượng bị khóa bởi trình duyệt.

## Pseudo-class chiều thời gian

Các pseudo-class này áp dụng khi xem nội dung có thời gian, chẳng hạn như track phụ đề [WebVTT](/en-US/docs/Web/API/WebVTT_API).

- {{CSSxRef(":current")}}
  - : Đại diện cho phần tử hoặc tổ tiên của phần tử đang được hiển thị.
- {{CSSxRef(":past")}}
  - : Đại diện cho phần tử xuất hiện hoàn toàn trước phần tử {{CSSxRef(":current")}}.
- {{CSSxRef(":future")}}
  - : Đại diện cho phần tử xuất hiện hoàn toàn sau phần tử {{CSSxRef(":current")}}.

## Pseudo-class cấu trúc cây

Các pseudo-class này liên quan đến vị trí của phần tử trong cây tài liệu.

- {{CSSxRef(":root")}}
  - : Đại diện cho phần tử là gốc của tài liệu. Trong HTML, thường là phần tử `<html>`.
- {{CSSxRef(":empty")}}
  - : Đại diện cho phần tử không có con nào ngoài các ký tự khoảng trắng.
- {{cssxref(":nth-child()")}}
  - : Sử dụng ký hiệu `An+B` để chọn phần tử từ danh sách các phần tử anh em.
- {{cssxref(":nth-last-child()")}}
  - : Sử dụng ký hiệu `An+B` để chọn phần tử từ danh sách các phần tử anh em, đếm ngược từ cuối danh sách.
- {{CSSxRef(":first-child")}}
  - : Khớp với phần tử là phần tử anh em đầu tiên.
- {{CSSxRef(":last-child")}}
  - : Khớp với phần tử là phần tử anh em cuối cùng.
- {{CSSxRef(":only-child")}}
  - : Khớp với phần tử không có anh em. Ví dụ: mục danh sách không có mục danh sách nào khác trong danh sách đó.
- {{CSSXRef(":heading_function", ":heading()")}}
  - : Sử dụng ký hiệu `An+B` để chọn các phần tử tiêu đề (`<h1>`-`<h6>`).
- {{cssxref(":nth-of-type()")}}
  - : Sử dụng ký hiệu `An+B` để chọn phần tử từ danh sách các phần tử anh em khớp với một kiểu nhất định từ danh sách phần tử anh em.
- {{cssxref(":nth-last-of-type()")}}
  - : Sử dụng ký hiệu `An+B` để chọn phần tử từ danh sách các phần tử anh em khớp với một kiểu nhất định từ danh sách phần tử anh em, đếm ngược từ cuối danh sách.
- {{CSSxRef(":first-of-type")}}
  - : Khớp với phần tử là phần tử anh em đầu tiên và cũng khớp với bộ chọn kiểu nhất định.
- {{CSSxRef(":last-of-type")}}
  - : Khớp với phần tử là phần tử anh em cuối cùng và cũng khớp với bộ chọn kiểu nhất định.
- {{CSSxRef(":only-of-type")}}
  - : Khớp với phần tử không có anh em của kiểu bộ chọn được chọn.

## Pseudo-class cấu trúc shadow

Các pseudo-class này liên quan đến shadow DOM.

- {{CSSxRef(":host")}}
  - : Khớp với shadow host của cây shadow.
- {{cssxref(":host()")}}
  - : Khớp với phần tử khớp với {{CSSxRef(":host")}} và khớp với bất kỳ bộ chọn nào trong danh sách được cung cấp.
- {{cssxref(":host-context()")}}
  - : Chọn các phần tử bên ngoài cây shadow trong ngữ cảnh của shadow host.
- {{CSSxRef(":has-slotted")}}
  - : Khớp với các phần tử slot đã được gán nội dung.

## Pseudo-class hành động người dùng

Các pseudo-class này yêu cầu một số tương tác từ người dùng để áp dụng, chẳng hạn như giữ con trỏ chuột qua phần tử.

- {{CSSxRef(":hover")}}
  - : Khớp khi người dùng chỉ định một mục bằng thiết bị trỏ, chẳng hạn như giữ con trỏ chuột qua mục.
- {{CSSxRef(":active")}}
  - : Khớp khi một mục đang được kích hoạt bởi người dùng. Ví dụ: khi mục được nhấp vào.
- {{CSSxRef(":focus")}}
  - : Khớp khi phần tử có focus.
- {{CSSxRef(":focus-visible")}}
  - : Khớp khi phần tử có focus và tác nhân người dùng xác định rằng phần tử nên được focus một cách rõ ràng.
- {{CSSxRef(":focus-within")}}
  - : Khớp với phần tử mà {{CSSxRef(":focus")}} áp dụng, cộng với bất kỳ phần tử nào có phần tử con mà {{CSSxRef(":focus")}} áp dụng.
- {{CSSxRef(":target-current")}}
  - : Khớp với pseudo-element {{cssxref("::scroll-marker")}} của một {{cssxref("scroll-marker-group")}} hiện đang được cuộn đến, nói cách khác là scroll marker **đang hoạt động**.

## Pseudo-class hàm

Các pseudo-class này nhận [danh sách bộ chọn](/en-US/docs/Web/CSS/Reference/Selectors/Selector_list) hoặc [danh sách bộ chọn tha thứ](/en-US/docs/Web/CSS/Reference/Selectors/Selector_list#forgiving_selector_list) làm tham số.

- {{cssxref(":is()")}}
  - : Pseudo-class khớp-bất-kỳ khớp với bất kỳ phần tử nào khớp với bất kỳ bộ chọn nào trong danh sách được cung cấp. Danh sách là tha thứ.
- {{cssxref(":not()")}}
  - : Pseudo-class phủ định, hoặc khớp-không-có-gì, đại diện cho bất kỳ phần tử nào không được đại diện bởi đối số của nó.
- {{cssxref(":where()")}}
  - : Pseudo-class điều chỉnh specificity khớp với bất kỳ phần tử nào khớp với bất kỳ bộ chọn nào trong danh sách được cung cấp mà không thêm bất kỳ trọng số specificity nào. Danh sách là tha thứ.
- {{cssxref(":has()")}}
  - : Pseudo-class quan hệ đại diện cho phần tử nếu bất kỳ bộ chọn tương đối nào khớp khi được neo vào phần tử đính kèm.

## Pseudo-class trạng thái tùy chỉnh

Các pseudo-class này áp dụng cho các phần tử tùy chỉnh.

- {{cssxref(":state()")}}
  - : Khớp với các phần tử tùy chỉnh có trạng thái tùy chỉnh được chỉ định.

## Pseudo-class trang

Các pseudo-class này liên quan đến các trang trong tài liệu in và được sử dụng với at-rule {{CSSxRef("@page")}}.

- {{CSSxRef(":left")}}
  - : Đại diện cho tất cả các trang bên trái của tài liệu in.
- {{CSSxRef(":right")}}
  - : Đại diện cho tất cả các trang bên phải của tài liệu in.
- {{CSSxRef(":first")}}
  - : Đại diện cho trang đầu tiên của tài liệu in.
- `:blank`
  - : Đại diện cho trang trống trong tài liệu in.

## Pseudo-class chuyển tiếp view

Các pseudo-class này liên quan đến các phần tử tham gia vào [chuyển tiếp view](/en-US/docs/Web/API/View_Transition_API).

- {{cssxref(":active-view-transition")}}
  - : Khớp với phần tử gốc của tài liệu khi [chuyển tiếp view](/en-US/docs/Web/API/View_Transition_API#concepts_and_usage) đang diễn ra (_đang hoạt động_) và ngừng khớp khi quá trình chuyển tiếp hoàn thành.
- {{cssxref(":active-view-transition-type()")}}
  - : Khớp với phần tử gốc của tài liệu khi [chuyển tiếp view](/en-US/docs/Web/API/View_Transition_API#concepts_and_usage) được chỉ định đang diễn ra (_đang hoạt động_) và ngừng khớp khi quá trình chuyển tiếp hoàn thành.

## Cú pháp

```css
selector:pseudo-class {
  property: value;
}
```

Giống như các lớp thông thường, bạn có thể kết hợp nhiều pseudo-class tùy thích trong một bộ chọn.

## Chỉ mục theo bảng chữ cái

Pseudo-class được định nghĩa bởi một tập hợp các thông số kỹ thuật CSS bao gồm các mục sau:

A

- {{CSSxRef(":active")}}
- {{CSSxRef(":active-view-transition")}}
- {{cssxref(":active-view-transition-type()")}}
- {{CSSxRef(":any-link")}}
- {{CSSxRef(":autofill")}}

B

- {{CSSxRef(":blank")}} (input) {{Experimental_Inline}}
- `:blank` (page)
- {{CSSxRef(":buffering")}}

C

- {{CSSxRef(":checked")}}
- {{CSSxRef(":current")}} {{Experimental_Inline}}

D

- {{CSSxRef(":default")}}
- {{CSSxRef(":defined")}}
- {{cssxref(":dir()")}}
- {{CSSxRef(":disabled")}}

E

- {{CSSxRef(":empty")}}
- {{CSSxRef(":enabled")}}

F

- {{CSSxRef(":first")}}
- {{CSSxRef(":first-child")}}
- {{CSSxRef(":first-of-type")}}
- {{CSSxRef(":focus")}}
- {{CSSxRef(":focus-visible")}}
- {{CSSxRef(":focus-within")}}
- {{CSSxRef(":fullscreen")}}
- {{CSSxRef(":future")}}

H

- {{CSSxRef(":has-slotted")}}
- {{cssxref(":has()")}}
- {{CSSXRef(":heading")}}
- {{CSSXRef(":heading_function", ":heading()")}}
- {{CSSxRef(":host")}}
- {{cssxref(":host()")}}
- {{cssxref(":host-context()")}}
- {{CSSxRef(":hover")}}

I

- {{CSSxRef(":in-range")}}
- {{CSSxRef(":indeterminate")}}
- {{CSSxRef(":interest-source")}}
- {{CSSxRef(":interest-target")}}
- {{CSSxRef(":invalid")}}
- {{cssxref(":is()")}}

L

- {{cssxref(":lang()")}}
- {{CSSxRef(":last-child")}}
- {{CSSxRef(":last-of-type")}}
- {{CSSxRef(":left")}}
- {{CSSxRef(":link")}}
- {{CSSxRef(":local-link")}} {{Experimental_Inline}}

M

- {{CSSxRef(":modal")}}
- {{CSSxRef(":muted")}}

N

- {{cssxref(":not()")}}
- {{cssxref(":nth-child()")}}
- {{cssxref(":nth-last-child()")}}
- {{cssxref(":nth-last-of-type()")}}
- {{cssxref(":nth-of-type()")}}

O

- {{CSSxRef(":only-child")}}
- {{CSSxRef(":only-of-type")}}
- {{CSSxRef(":open")}}
- {{CSSxRef(":optional")}}
- {{CSSxRef(":out-of-range")}}

P

- {{CSSxRef(":past")}}
- {{CSSxRef(":paused")}}
- {{CSSxRef(":picture-in-picture")}}
- {{CSSxRef(":placeholder-shown")}}
- {{CSSxRef(":playing")}}
- {{CSSxRef(":popover-open")}}

R

- {{CSSxRef(":read-only")}}
- {{CSSxRef(":read-write")}}
- {{CSSxRef(":required")}}
- {{CSSxRef(":right")}}
- {{CSSxRef(":root")}}

S

- {{CSSxRef(":scope")}}
- {{CSSxRef(":seeking")}}
- {{CSSxRef(":stalled")}}
- {{cssxref(":state()")}}

T

- {{CSSxRef(":target")}}
- {{CSSxRef(":target-after")}}
- {{CSSxRef(":target-current")}}
- {{CSSxRef(":target-before")}}

U

- {{CSSxRef(":user-invalid")}}
- {{CSSxRef(":user-valid")}}

V

- {{CSSxRef(":valid")}}
- {{CSSxRef(":visited")}}
- {{CSSxRef(":volume-locked")}}

W

- {{cssxref(":where()")}}

### Pseudo-class không chuẩn

Các pseudo-class không chuẩn có tiền tố vendor bao gồm:

#### Tiền tố `-moz-`

- {{CSSxRef(":-moz-broken")}}
- {{CSSxRef(":-moz-drag-over")}}
- {{CSSxRef(":-moz-first-node")}}
- {{CSSxRef(":-moz-handler-blocked")}}
- {{CSSxRef(":-moz-handler-crashed")}}
- {{CSSxRef(":-moz-handler-disabled")}}
- {{CSSxRef(":-moz-last-node")}}
- {{CSSxRef(":-moz-loading")}}
- {{CSSxRef(":-moz-locale-dir_ltr", ":-moz-locale-dir(ltr)")}}
- {{CSSxRef(":-moz-locale-dir_rtl", ":-moz-locale-dir(rtl)")}}
- {{CSSxRef(":-moz-only-whitespace")}}
- {{CSSxRef(":-moz-submit-invalid")}}
- {{CSSxRef(":-moz-suppressed")}}
- {{CSSxRef(":-moz-user-disabled")}}
- {{CSSxRef(":-moz-window-inactive")}}

## Thông số kỹ thuật

{{Specifications}}

## Xem thêm

- [Pseudo-elements](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-elements)
- [CSS selectors](/en-US/docs/Web/CSS/Guides/Selectors) module
