---
title: "ARIA: vai trò feed"
short-title: feed
slug: Web/Accessibility/ARIA/Reference/Roles/feed_role
page-type: aria-role
spec-urls: https://w3c.github.io/aria/#feed
sidebar: accessibilitysidebar
---

Một `feed` là một `list` có thể cuộn và động gồm các `article`, trong đó các article được thêm vào hoặc xóa khỏi một trong hai đầu danh sách khi người dùng cuộn. Một `feed` cho phép trình đọc màn hình dùng con trỏ đọc của chế độ duyệt để vừa đọc vừa cuộn qua một luồng nội dung phong phú có thể cuộn vô hạn bằng cách tải thêm nội dung khi người dùng đọc.

```html
<section role="feed" aria-busy="false">
  …
  <article aria-posinset="427" aria-setsize="-1">…</article>
  <article aria-posinset="428" aria-setsize="-1">…</article>
  <article aria-posinset="429" aria-setsize="-1">…</article>
  …
</section>
```

## Mô tả

`feed` là một dạng [`list`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/list_role), vai trò vùng chứa cho các [`article`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/article_role) có thể cuộn, trong đó việc cuộn có thể khiến các article được thêm vào đầu hoặc cuối danh sách. Vai trò này cho phép công nghệ hỗ trợ dùng con trỏ đọc của chế độ duyệt để vừa đọc vừa cuộn qua một luồng nội dung phong phú có thể cuộn vô hạn bằng cách tải thêm nội dung khi người dùng đọc. Các ví dụ gồm nguồn cấp RSS, nguồn cấp tin tức, nguồn cấp mạng xã hội như Facebook, Instagram hoặc Mastodon, hoặc thậm chí danh sách sản phẩm liên quan trên trang thương mại điện tử. Những luồng này có thể hữu hạn hoặc vô hạn, tải thêm nội dung khi người dùng cuộn. Việc triển khai mẫu `feed` cho phép trình đọc màn hình đọc đáng tin cậy và kích hoạt việc tải nội dung feed khi ở chế độ đọc.

Không giống các phần tử cấu trúc tài liệu đại diện cho phần tử HTML tĩnh, vai trò `feed` yêu cầu các tương tác cụ thể và việc triển khai điều hướng bằng bàn phím. `feed` là một phần tử vùng chứa mà các phần tử con của nó là các {{HTMLElement('article')}} hoặc có vai trò `article`. Mỗi article trong feed nên có thể nhận tiêu điểm, với tabindex là 0 hoặc -1. Một article nên được cuộn vào khung nhìn khi chính nó hoặc một phần tử con của nó nhận tiêu điểm. Nếu việc thêm article chiếm luồng chính của trình duyệt, hãy nhớ đặt `aria-busy="true"` trên chính feed, và nhớ đặt lại `false` khi quá trình xử lý kết thúc, nếu không người dùng có thể không thấy các cập nhật.

Nếu biết số lượng article, hãy đặt [`aria-setsize`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-setsize) trên chính các article. Tuy nhiên, nếu tổng số quá lớn, không xác định hoặc thay đổi thường xuyên, hãy đặt `aria-setsize="-1"` để cho biết kích thước feed không được biết.

Một tính năng khác của mẫu feed là đọc lướt: Các article trong feed có thể chứa cả tên truy cập với [`aria-label`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-label) và mô tả với `aria-describedby`, gợi ý cho trình đọc màn hình nên đọc những phần tử nào sau nhãn khi điều hướng theo article. Bằng cách xác định các phần tử trong article cung cấp tiêu đề và nội dung chính, công nghệ hỗ trợ có thể cung cấp các chức năng cho phép người dùng nhảy từ article này sang article khác và dễ dàng nhận biết article nào họ muốn đọc.

Mẫu feed cho phép tương tác chế độ đọc đáng tin cậy của công nghệ hỗ trợ bằng cách thiết lập thỏa thuận tương tác sau giữa trang web và công nghệ hỗ trợ:

Trong ngữ cảnh của feed, mã trang web chịu trách nhiệm về:

- Cuộn nội dung một cách trực quan phù hợp dựa trên article nào chứa tiêu điểm DOM.
- Tải hoặc xóa các article của feed dựa trên article nào chứa tiêu điểm DOM.

### Tương tác bàn phím

Nên hỗ trợ các thao tác sau, hoặc giao diện tương tự, khi tiêu điểm nằm bên trong feed:

- <kbd>Page Down</kbd>: Chuyển tiêu điểm tới article tiếp theo.
- <kbd>Page Up</kbd>: Chuyển tiêu điểm tới article trước đó.
- <kbd>Control + End</kbd>: Chuyển tiêu điểm tới phần tử có thể nhận tiêu điểm đầu tiên sau feed.
- <kbd>Control + Home</kbd>: Chuyển tiêu điểm tới phần tử có thể nhận tiêu điểm đầu tiên trước feed.

Nếu feed được lồng trong một feed khác, chẳng hạn feed bình luận bên trong feed bài blog, quy ước là tab vào feed lồng bằng phím <kbd>Tab</kbd> và cung cấp một phím khác, chẳng hạn <kbd>Alt + Page Down</kbd>, để điều hướng từ một article "bên ngoài" tới mục đầu tiên trong feed lồng của article đó. Điều hướng giữa feed lồng và feed chính bằng <kbd>Control + End</kbd>, chuyển tiêu điểm từ feed bên trong tới article tiếp theo trong feed bên ngoài.

### Các vai trò, trạng thái và thuộc tính WAI-ARIA liên quan

- [`aria-label`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-label)
  - : Nếu feed không có tiêu đề hiển thị, phần tử `feed` phải có nhãn được chỉ định bằng `aria-label`. Nếu có tiêu đề, xem `aria-labelledby`.

- [`aria-labelledby`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-labelledby)
  - : Nếu feed có tiêu đề hiển thị, phần tử `feed` phải có `aria-labelledby` tham chiếu tới phần tử chứa tiêu đề đó. Nếu không, hãy thêm `aria-label`.

- [`aria-busy`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-busy)
  - : Khi đang bận, chẳng hạn khi article đang được thêm hoặc xóa khỏi `feed`, hãy đặt `aria-busy="true"` trong quá trình cập nhật. Hãy bảo đảm nó được đặt lại thành `false` khi thao tác hoàn tất, nếu không các thay đổi có thể không trở nên hiển thị.

- article
  - : Mỗi phần nội dung trong feed nên nằm trong một `<article>` hoặc phần tử có vai trò [`article`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/article_role). Mỗi `article` nên có `aria-labelledby` tham chiếu đến tiêu đề article hoặc một phần tử con khác có thể làm nhãn phân biệt. Mỗi article cũng nên có `aria-describedby` tham chiếu đến một hoặc nhiều phần tử bên trong article đóng vai trò nội dung chính của article. Mỗi phần tử `article` phải có [`aria-posinset`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-posinset) được đặt thành giá trị thể hiện vị trí của nó trong feed và [`aria-setsize`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-setsize) được đặt thành giá trị thể hiện tổng số article đã được tải hoặc tổng số article trong feed, tùy giá trị nào hữu ích hơn cho người dùng. Nếu không biết tổng số trong feed, hãy đặt `aria-setsize="-1"`.

### Các tính năng JavaScript bắt buộc

Không có, ngoài những gì được yêu cầu bởi các thuộc tính. Ví dụ, đặt [`aria-busy`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-busy) thành `true` trong quá trình cập nhật nếu cần, rồi đặt lại thành `false` khi hoàn tất.

Lưu ý: Tác giả có trách nhiệm áp dụng hành vi bàn phím "ở phía trên".

## Ví dụ

[Ví dụ triển khai mẫu Feed](https://www.w3.org/WAI/ARIA/apg/patterns/feed/examples/feed/)

## Thực hành tốt nhất

Để bảo đảm trải nghiệm người dùng tốt, hãy tránh chèn hoặc xóa article ở giữa `feed`, tải article mới trước khi người dùng chạm tới cuối feed, và cung cấp các lệnh bàn phím để di chuyển tiêu điểm giữa các article để người dùng bàn phím có thể điều hướng qua feed của bạn. Xem [Tương tác bàn phím](#keyboard_interactions).

## Đặc tả

{{Specifications}}

## Xem thêm

- Phần tử {{HTMLElement('article')}} của HTML
- Phần tử danh sách không thứ tự {{HTMLElement('ul')}}
- [vai trò `article`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/article_role)
- [vai trò `list`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/list_role)
