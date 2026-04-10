---
title: "Element: phương thức ariaNotify()"
short-title: ariaNotify()
slug: Web/API/Element/ariaNotify
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.Element.ariaNotify
---

{{ApiRef("DOM")}}{{SeeCompatTable}}

Phương thức **`ariaNotify()`** của giao diện {{domxref("Element")}} chỉ định rằng một chuỗi văn bản đã cho sẽ được thông báo bởi {{glossary("screen reader")}} nếu có sẵn và được kích hoạt.

## Cú pháp

```js-nolint
ariaNotify(announcement)
ariaNotify(announcement, options)
```

### Tham số

- `announcement`
  - : Một chuỗi chỉ định văn bản cần được thông báo.
- `options` {{optional_inline}}
  - : Một đối tượng tùy chọn chứa các thuộc tính sau:
    - `priority`
      - : Một giá trị liệt kê chỉ định mức độ ưu tiên của thông báo. Các giá trị có thể là:
        - `normal`
          - : Thông báo có mức ưu tiên bình thường. Nó sẽ được đọc sau bất kỳ thông báo nào mà trình đọc màn hình đang thực hiện.
        - `high`
          - : Thông báo có mức ưu tiên cao. Nó sẽ được đọc ngay lập tức, làm gián đoạn bất kỳ thông báo nào mà trình đọc màn hình đang thực hiện.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Mô tả

Phương thức **`ariaNotify()`** có thể được sử dụng để kích hoạt thông báo trình đọc màn hình theo chương trình. Phương thức này cung cấp chức năng tương tự như [vùng trực tiếp ARIA](/en-US/docs/Web/Accessibility/ARIA/Guides/Live_regions), với một số ưu điểm:

- Vùng trực tiếp chỉ có thể đưa ra thông báo sau các thay đổi đối với DOM, trong khi thông báo `ariaNotify()` có thể được thực hiện bất cứ lúc nào.
- Thông báo vùng trực tiếp liên quan đến việc đọc nội dung đã cập nhật của nút DOM đã thay đổi, trong khi nội dung thông báo `ariaNotify()` có thể được định nghĩa độc lập với nội dung DOM.

Các nhà phát triển thường khắc phục các hạn chế của vùng trực tiếp bằng cách sử dụng các nút DOM ẩn với vùng trực tiếp được thiết lập trên chúng, nội dung của chúng được cập nhật với nội dung cần thông báo. Điều này không hiệu quả và dễ gây lỗi, và `ariaNotify()` cung cấp một cách để tránh các vấn đề như vậy.

Một số trình đọc màn hình sẽ đọc nhiều thông báo `ariaNotify()` theo thứ tự, nhưng điều này không thể đảm bảo trên tất cả trình đọc màn hình và nền tảng. Thông thường, chỉ thông báo gần nhất được đọc. Kết hợp nhiều thông báo thành một sẽ đáng tin cậy hơn.

Ví dụ, các lời gọi sau:

```js
elemRef.ariaNotify("Hello there.");
elemRef.ariaNotify("The time is now 8 o'clock.");
```

sẽ tốt hơn nếu kết hợp:

```js
elemRef.ariaNotify("Hello there. The time is now 8 o'clock.");
```

Lời gọi `ariaNotify()` có thể được kích hoạt trên bất kỳ phần tử nào trong DOM, ngoại trừ những phần tử mà trình duyệt không coi là "thú vị" cho khả năng tiếp cận và bỏ qua khi xây dựng cây khả năng tiếp cận. Chính xác những phần tử nào bị bỏ qua thay đổi tùy theo trình duyệt, nhưng danh sách thường bao gồm các phần tử vùng chứa có ít hoặc không có giá trị ngữ nghĩa, chẳng hạn như các phần tử {{htmlelement("html")}} và {{htmlelement("body")}}.

Thông báo `ariaNotify()` không yêu cầu {{glossary("transient_activation")}}; bạn nên cẩn thận không spam người dùng trình đọc màn hình với quá nhiều thông báo, vì điều này có thể tạo ra trải nghiệm người dùng tồi tệ.

### Mức độ ưu tiên thông báo

Thông báo `ariaNotify()` với `priority: high` được thông báo trước thông báo `ariaNotify()` với `priority: normal`.

Thông báo `ariaNotify()` tương đương với thông báo vùng trực tiếp ARIA như sau:

- `ariaNotify()` `priority: high`: `aria-live="assertive"`.
- `ariaNotify()` `priority: normal`: `aria-live="polite"`.

Tuy nhiên, thông báo `aria-live` sẽ được ưu tiên hơn thông báo `ariaNotify()`.

### Lựa chọn ngôn ngữ

Trình đọc màn hình chọn giọng nói phù hợp để đọc thông báo `ariaNotify()` (về giọng, phát âm, v.v.) dựa trên ngôn ngữ được chỉ định trong thuộc tính [`lang`](/en-US/docs/Web/HTML/Reference/Global_attributes/lang) của phần tử hoặc, nếu phần tử không có thuộc tính `lang` được chỉ định, thuộc tính `lang` được thiết lập trên phần tử tổ tiên gần nhất. Nếu không có thuộc tính `lang` nào được chỉ định trong HTML, ngôn ngữ mặc định của user agent sẽ được sử dụng.

### Tích hợp chính sách quyền

Việc sử dụng `ariaNotify()` trong tài liệu hoặc {{htmlelement("iframe")}} có thể được kiểm soát bởi {{httpheader("Permissions-Policy/aria-notify", "aria-notify")}} [Chính sách quyền](/en-US/docs/Web/HTTP/Guides/Permissions_Policy).

Cụ thể, khi chính sách được định nghĩa chặn việc sử dụng, bất kỳ thông báo nào được tạo bằng `ariaNotify()` sẽ thất bại âm thầm (chúng sẽ không được gửi).

## Ví dụ

Để biết ví dụ chi tiết hơn, xem [Ví dụ danh sách mua sắm dễ tiếp cận](/en-US/docs/Web/API/Document/ariaNotify#accessible_shopping_list_example) trên trang {{domxref("Document.ariaNotify()")}}. Ví dụ sẽ hoạt động tương tự nếu bạn gọi `ariaNotify()` trên tham chiếu phần tử thay vì đối tượng `Document`.

### Sử dụng `ariaNotify()` cơ bản

Ví dụ này bao gồm một {{htmlelement("button")}} kích hoạt thông báo trình đọc màn hình trên chính nó khi được nhấp.

```html live-sample___basic-arianotify
<button>Press</button>
```

```css hidden live-sample___basic-arianotify
html,
body {
  height: 100%;
}

body {
  display: flex;
  justify-content: center;
  align-items: center;
}
```

```js live-sample___basic-arianotify
document.querySelector("button").addEventListener("click", () => {
  document.querySelector("button").ariaNotify("You ain't seen me, right?");
});
```

#### Kết quả

Kết quả như sau:

{{EmbedLiveSample("basic-arianotify", "100%", 60, , , , "aria-notify")}}

Thử kích hoạt trình đọc màn hình và sau đó nhấn nút bấm. Bạn sẽ nghe thấy "You ain't seen me, right?" được đọc bởi trình đọc màn hình.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Document.ariaNotify()")}}
- [Vùng trực tiếp ARIA](/en-US/docs/Web/Accessibility/ARIA/Guides/Live_regions)
