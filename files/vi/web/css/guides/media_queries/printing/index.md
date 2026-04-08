---
title: Printing
slug: Web/CSS/Guides/Media_queries/Printing
page-type: guide
sidebar: cssref
---

Có những lúc trang web hay ứng dụng của bạn muốn cải thiện trải nghiệm người dùng khi in nội dung. Có một số tình huống có thể xảy ra:

- Bạn muốn điều chỉnh bố cục để tận dụng kích thước và hình dạng của giấy.
- Bạn muốn sử dụng các style khác nhau để cải thiện giao diện của nội dung trên giấy.
- Bạn muốn sử dụng hình ảnh có độ phân giải cao hơn để có kết quả tốt hơn.
- Bạn muốn điều chỉnh trải nghiệm người dùng khi in, chẳng hạn như trình bày phiên bản định dạng đặc biệt của nội dung trước khi bắt đầu in.

Có thể có những trường hợp khác khi bạn muốn quản lý quy trình in, nhưng đây là một số tình huống phổ biến nhất. Bài viết này cung cấp các mẹo và kỹ thuật giúp nội dung web của bạn in tốt hơn.

## Sử dụng print style sheet

Thêm nội dung sau vào thẻ {{HTMLElement("head")}} của bạn.

```html
<link href="/path/to/print.css" media="print" rel="stylesheet" />
```

## Sử dụng media query và @page để kiểm soát nội dung in

Bạn có thể sử dụng CSS at-rule {{cssxref("@media")}} để đặt các style khác nhau cho trang web của bạn khi được in trên giấy hoặc dưới dạng PDF so với khi được hiển thị trên màn hình. [Media type](/en-US/docs/Web/CSS/Reference/At-rules/@media#media_types) `print` đặt các style cho phương tiện in; những style này sẽ chỉ được sử dụng cho nội dung in.

Thêm phần này vào cuối stylesheet của bạn. Lưu ý rằng các quy tắc [specificity](/en-US/docs/Web/CSS/Guides/Cascade/Specificity) và ưu tiên vẫn áp dụng:

```css
@media print {
  /* All your print styles go here */
  #header,
  #footer,
  #nav {
    display: none !important;
  }
}
```

Bạn cũng có thể sử dụng at-rule {{cssxref("@page")}} để sửa đổi các khía cạnh khác nhau của các trang in bao gồm kích thước trang, hướng và lề. At-rule `@page` có thể được sử dụng để nhắm mục tiêu tất cả các trang trong bản in hoặc chỉ một tập hợp con cụ thể của các trang.

## Phát hiện yêu cầu in

Trình duyệt gửi các sự kiện {{domxref("Window/beforeprint_event", "beforeprint")}} và {{domxref("Window/afterprint_event", "afterprint")}} để xác định khi nào việc in có thể đã xảy ra. Bạn có thể sử dụng điều này để điều chỉnh giao diện người dùng được trình bày trong quá trình in (ví dụ hiển thị hoặc ẩn các phần tử giao diện người dùng trong quá trình in).

## Ví dụ

Đây là một số ví dụ phổ biến.

### Tự động đóng cửa sổ khi hoàn thành

Ví dụ sau sẽ đóng cửa sổ sau khi người dùng đã in nội dung của nó:

```js
window.addEventListener("afterprint", () => self.close);
```

### In một trang bên ngoài mà không cần mở nó

Nếu bạn muốn có thể in một trang bên ngoài mà không cần mở nó, bạn có thể sử dụng một {{HTMLElement("iframe")}} ẩn (xem: [HTMLIFrameElement](/en-US/docs/Web/API/HTMLIFrameElement)), tự động xóa nó sau khi người dùng in nội dung của nó. Sau đây là một ví dụ có thể in một file có tên `externalPage.html`:

#### HTML

```html
<button id="print_external">Print external page!</button>
```

#### JavaScript

```js
function setPrint() {
  const closePrint = () => {
    document.body.removeChild(this);
  };
  this.contentWindow.onbeforeunload = closePrint;
  this.contentWindow.onafterprint = closePrint;
  this.contentWindow.print();
}

document.getElementById("print_external").addEventListener("click", () => {
  const hideFrame = document.createElement("iframe");
  hideFrame.onload = setPrint;
  hideFrame.style.display = "none"; // hide iframe
  hideFrame.src = "external-page.html";
  document.body.appendChild(hideFrame);
});
```

## Xem thêm

- [`window.print`](/en-US/docs/Web/API/Window/print)
- Sự kiện {{ domxref("window.beforeprint_event", "beforeprint") }}
- Sự kiện {{ domxref("window.afterprint_event", "afterprint") }}
- [Media queries](/en-US/docs/Web/CSS/Guides/Media_queries/Using)
- {{cssxref("@media")}}
- Module [CSS paged media](/en-US/docs/Web/CSS/Guides/Paged_media)
