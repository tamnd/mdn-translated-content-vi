---
title: View Transition API
slug: Web/API/View_Transition_API
page-type: web-api-overview
browser-compat:
  - api.Document.startViewTransition
  - css.at-rules.view-transition
spec-urls:
  - https://drafts.csswg.org/css-view-transitions-2/
  - https://drafts.csswg.org/css-view-transitions/
---

{{DefaultAPISidebar("View Transition API")}}

**View Transition API** cung cấp cơ chế để dễ dàng tạo các hiệu ứng chuyển động có animation giữa các khung nhìn khác nhau của trang web. Điều này bao gồm hoạt hóa chuyển đổi giữa các trạng thái DOM trong ứng dụng một trang (SPA) và hoạt hóa điều hướng giữa các tài liệu trong ứng dụng nhiều trang (MPA).

## Khái niệm và cách sử dụng

Chuyển đổi khung nhìn là một lựa chọn thiết kế phổ biến để giảm tải nhận thức cho người dùng, giúp họ duy trì ngữ cảnh và giảm độ trễ tải nhận thấy khi họ di chuyển giữa các trạng thái hoặc khung nhìn của ứng dụng.

Tuy nhiên, việc tạo chuyển đổi khung nhìn trên web trước đây rất khó khăn:

- Các chuyển đổi giữa các trạng thái trong ứng dụng một trang (SPA) thường đòi hỏi viết CSS và JavaScript đáng kể để:
  - Xử lý việc tải và định vị nội dung cũ và mới.
  - Hoạt hóa các trạng thái cũ và mới để tạo chuyển đổi.
  - Ngăn chặn tương tác người dùng ngẫu nhiên với nội dung cũ gây ra vấn đề.
  - Xóa nội dung cũ sau khi chuyển đổi hoàn tất.
    Các vấn đề về khả năng tiếp cận như mất vị trí đọc, nhầm lẫn focus và thông báo live region kỳ lạ cũng có thể xảy ra khi nội dung mới và cũ đều có mặt trong DOM cùng lúc.
- Chuyển đổi khung nhìn giữa các tài liệu khác nhau (tức là điều hướng giữa các trang khác nhau trong MPA) về mặt lịch sử là không thể.

View Transition API cung cấp một cách dễ dàng để xử lý các thay đổi khung nhìn và animation chuyển đổi cần thiết cho cả hai trường hợp sử dụng trên.

Việc tạo chuyển đổi khung nhìn sử dụng animation chuyển đổi mặc định của trình duyệt rất nhanh, và có các tính năng cho phép bạn vừa tùy chỉnh animation chuyển đổi vừa điều khiển bản thân chuyển đổi khung nhìn (ví dụ chỉ định điều kiện bỏ qua animation) cho cả SPA và MPA.

Xem [Sử dụng View Transition API](/en-US/docs/Web/API/View_Transition_API/Using) để biết thêm thông tin.

## Giao diện

- {{domxref("CSSViewTransitionRule")}}
  - : Đại diện cho quy tắc {{cssxref("@view-transition")}} [at-rule](/en-US/docs/Web/CSS/Guides/Syntax/At-rules).
- {{domxref("ViewTransition")}}
  - : Đại diện cho một chuyển đổi khung nhìn và cung cấp chức năng để phản hồi khi chuyển đổi đạt đến các trạng thái khác nhau (ví dụ sẵn sàng chạy animation hoặc animation kết thúc) hoặc bỏ qua chuyển đổi hoàn toàn.
- {{domxref("ViewTransitionTypeSet")}}
  - : Đối tượng [giống như set](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Set#set-like_browser_apis) đại diện cho các loại của chuyển đổi khung nhìn đang hoạt động, cho phép các loại được truy vấn hoặc sửa đổi trong quá trình chuyển đổi.

## Mở rộng sang các giao diện khác

- {{domxref("Document.startViewTransition()")}}
  - : Bắt đầu một chuyển đổi khung nhìn cùng tài liệu (SPA) mới và trả về đối tượng {{domxref("ViewTransition")}} để đại diện cho nó.
- {{domxref("PageRevealEvent")}}
  - : Đối tượng sự kiện cho sự kiện {{domxref("Window.pagereveal_event", "pagereveal")}}. Trong quá trình điều hướng giữa các tài liệu, nó cho phép bạn điều khiển chuyển đổi khung nhìn liên quan (cung cấp quyền truy cập vào đối tượng {{domxref("ViewTransition")}} liên quan) từ tài liệu đang được điều hướng _đến_, nếu chuyển đổi khung nhìn được kích hoạt bởi điều hướng.
- {{domxref("PageSwapEvent")}}
  - : Đối tượng sự kiện cho sự kiện {{domxref("Window.pageswap_event", "pageswap")}}. Trong quá trình điều hướng giữa các tài liệu, nó cho phép bạn điều khiển chuyển đổi khung nhìn liên quan (cung cấp quyền truy cập vào đối tượng {{domxref("ViewTransition")}} liên quan) từ tài liệu đang được điều hướng _từ_, nếu chuyển đổi khung nhìn được kích hoạt bởi điều hướng. Nó cũng cung cấp quyền truy cập vào thông tin về loại điều hướng và các mục lịch sử tài liệu hiện tại và đích.
- Sự kiện {{domxref("Window")}} {{domxref("Window.pagereveal_event", "pagereveal")}}
  - : Kích hoạt khi tài liệu được hiển thị lần đầu, khi tải tài liệu mới từ mạng hoặc kích hoạt tài liệu (từ [bộ nhớ đệm back/forward](/en-US/docs/Glossary/bfcache) (bfcache) hoặc [prerender](/en-US/docs/Glossary/Prerender)).
- Sự kiện {{domxref("Window")}} {{domxref("Window.pageswap_event", "pageswap")}}
  - : Kích hoạt khi tài liệu sắp bị gỡ tải do điều hướng.

## Bổ sung HTML

- [`<link rel="expect">`](/en-US/docs/Web/HTML/Reference/Attributes/rel#expect)
  - : Xác định nội dung quan trọng nhất trong tài liệu liên quan cho chế độ xem ban đầu của người dùng về trang. Việc hiển thị tài liệu sẽ bị chặn cho đến khi nội dung quan trọng được phân tích, đảm bảo một lần vẽ đầu tiên nhất quán và do đó, chuyển đổi khung nhìn trên tất cả các trình duyệt hỗ trợ.

## Bổ sung CSS

### At-rules

- {{cssxref("@view-transition")}}
  - : Trong trường hợp điều hướng giữa các tài liệu, `@view-transition` được sử dụng để cho phép tài liệu hiện tại và tài liệu đích tham gia vào chuyển đổi khung nhìn.

### Thuộc tính

- {{cssxref("view-transition-name")}}
  - : Chỉ định ảnh chụp màn hình chuyển đổi khung nhìn mà các phần tử được chọn sẽ tham gia, cho phép một phần tử được hoạt hóa riêng biệt với phần còn lại của trang trong quá trình chuyển đổi.
- {{cssxref("view-transition-class")}}
  - : Cung cấp một phương thức bổ sung để tạo kiểu cho các phần tử được chọn có `view-transition-name`.

### Pseudo-class

- {{cssxref(":active-view-transition")}}
  - : Khớp các phần tử khi có chuyển đổi khung nhìn đang diễn ra.
- {{cssxref(":active-view-transition-type()")}}
  - : Khớp các phần tử khi có chuyển đổi khung nhìn với một hoặc nhiều loại cụ thể đang diễn ra.

### Pseudo-element

- {{cssxref("::view-transition")}}
  - : Gốc của lớp phủ chuyển đổi khung nhìn, chứa tất cả các chuyển đổi và nằm phía trên tất cả nội dung trang khác.
- {{cssxref("::view-transition-group()")}}
  - : Gốc của một chuyển đổi khung nhìn đơn.
- {{cssxref("::view-transition-image-pair()")}}
  - : Vùng chứa cho khung nhìn cũ và mới của chuyển đổi, trước và sau chuyển đổi.
- {{cssxref("::view-transition-old()")}}
  - : Ảnh chụp tĩnh của khung nhìn cũ, trước khi chuyển đổi.
- {{cssxref("::view-transition-new()")}}
  - : Biểu diễn trực tiếp của khung nhìn mới, sau khi chuyển đổi.

## Ví dụ

- [Demo SPA View Transitions cơ bản](https://mdn.github.io/dom-examples/view-transitions/spa/): Demo thư viện ảnh cơ bản với chuyển đổi khung nhìn, có animation riêng biệt giữa ảnh cũ và mới, và chú thích cũ và mới.
- [Demo MPA View Transitions cơ bản](https://mdn.github.io/dom-examples/view-transitions/mpa/): Trang web mẫu hai trang thể hiện việc sử dụng chuyển đổi khung nhìn giữa các tài liệu (MPA), cung cấp chuyển đổi "vuốt lên" tùy chỉnh khi điều hướng giữa hai trang.
- [Demo view transitions `match-element`](/en-US/docs/Web/CSS/Reference/Properties/view-transition-name#using_the_match-element_value): SPA có các mục danh sách được hoạt hóa, thể hiện việc sử dụng giá trị `match-element` của thuộc tính `view-transition-name` để hoạt hóa các phần tử riêng lẻ.
- [Danh sách phát HTTP 203](https://http203-playlist.netlify.app/): Demo ứng dụng trình phát video với nhiều chuyển đổi khung nhìn SPA khác nhau, nhiều trong số đó được giải thích trong [Smooth transitions with the View Transition API](https://developer.chrome.com/docs/web-platform/view-transitions/).
- [Demo View Transition API của Chrome DevRel](https://view-transitions.chrome.dev/): Một loạt các demo View Transition API.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Smooth transitions with the View Transition API](https://developer.chrome.com/docs/web-platform/view-transitions/) trên developer.chrome.com (2024)
- [View Transition API: Creating Smooth Page Transitions](https://stackdiary.com/view-transitions-api/) trên stackdiary.com (2023)
- [View Transitions API: Single Page Apps Without a Framework](https://www.debugbear.com/blog/view-transitions-spa-without-framework) trên DebugBear (2024)
