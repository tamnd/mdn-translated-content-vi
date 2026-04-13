---
title: Navigation API
slug: Web/API/Navigation_API
page-type: web-api-overview
browser-compat:
  - api.Navigation
  - api.NavigationDestination
  - api.NavigationHistoryEntry
  - api.NavigationTransition
spec-urls: https://html.spec.whatwg.org/multipage/nav-history-apis.html#navigation-api
---

{{DefaultAPISidebar("Navigation API")}}

**Navigation API** cung cấp khả năng khởi tạo, chặn và quản lý các hành động điều hướng trình duyệt. Nó cũng có thể kiểm tra các mục lịch sử của ứng dụng. Đây là phiên bản kế thừa của các tính năng nền tảng web trước đó như {{domxref("History API", "", "", "nocode")}} và {{domxref("window.location")}}, khắc phục các nhược điểm của chúng và đặc biệt nhắm đến nhu cầu của {{glossary("SPA", "các ứng dụng đơn trang (SPAs)")}}.

## Khái niệm và cách sử dụng

Trong các SPA, mẫu trang thường giữ nguyên trong quá trình sử dụng và nội dung được viết lại động khi người dùng truy cập các trang hoặc tính năng khác nhau. Kết quả là chỉ một trang riêng biệt được tải trong trình duyệt, điều này phá vỡ trải nghiệm người dùng dự kiến khi điều hướng qua lại giữa các vị trí khác nhau trong lịch sử xem. Vấn đề này có thể được giải quyết ở mức độ nào đó thông qua {{domxref("History API", "", "", "nocode")}}, nhưng nó không được thiết kế cho nhu cầu của SPA. Navigation API nhằm mục đích thu hẹp khoảng cách đó.

API được truy cập thông qua thuộc tính {{domxref("Window.navigation")}}, trả về tham chiếu đến đối tượng {{domxref("Navigation")}} toàn cục. Mỗi đối tượng `window` có một thực thể `navigation` tương ứng của riêng nó.

### Xử lý điều hướng

Giao diện `navigation` có một số sự kiện liên quan, đáng chú ý nhất là sự kiện {{domxref("Navigation/navigate_event", "navigate")}}. Sự kiện này được kích hoạt khi [bất kỳ loại điều hướng nào](https://github.com/WICG/navigation-api#appendix-types-of-navigations) được khởi tạo, nghĩa là bạn có thể kiểm soát tất cả các điều hướng trang từ một vị trí trung tâm, lý tưởng cho chức năng định tuyến trong các framework SPA. (Đây không phải là trường hợp với {{domxref("History API", "", "", "nocode")}}, nơi đôi khi khó phát hiện và phản hồi tất cả các điều hướng.) Trình xử lý sự kiện `navigate` được truyền một đối tượng {{domxref("NavigateEvent")}}, chứa thông tin chi tiết bao gồm các chi tiết về đích đến của điều hướng, loại, liệu nó có chứa dữ liệu biểu mẫu `POST` hoặc yêu cầu tải xuống hay không, v.v.

Đối tượng `NavigateEvent` cũng cung cấp hai phương thức:

- {{domxref("NavigateEvent.intercept", "intercept()")}} cho phép bạn chỉ định hành vi tùy chỉnh cho các điều hướng và có thể nhận các đối số sau:
  - Các hàm trình xử lý gọi lại cho phép bạn chỉ định điều gì xảy ra cả _khi_ điều hướng được commit và _ngay trước khi_ điều hướng được commit. Ví dụ: bạn có thể tải nội dung mới phù hợp vào giao diện người dùng dựa trên đường dẫn của URL được điều hướng đến, hoặc chuyển hướng trình duyệt đến trang đăng nhập nếu URL trỏ đến trang bị hạn chế và người dùng chưa đăng nhập.
  - Các thuộc tính cho phép bạn bật hoặc tắt hành vi cuộn và tiêu điểm mặc định của trình duyệt sau khi điều hướng xảy ra.
- {{domxref("NavigateEvent.scroll", "scroll()")}} cho phép bạn khởi tạo thủ công hành vi cuộn của trình duyệt (ví dụ: đến định danh đoạn mã trong URL), nếu phù hợp với mã của bạn, thay vì chờ trình duyệt tự động xử lý.

Khi điều hướng được khởi tạo và trình xử lý `intercept()` của bạn được gọi, một thực thể đối tượng {{domxref("NavigationTransition")}} được tạo (có thể truy cập thông qua {{domxref("Navigation.transition")}}), có thể được sử dụng để theo dõi quá trình điều hướng đang diễn ra.

> [!NOTE]
> Trong ngữ cảnh này, "transition" (chuyển tiếp) đề cập đến quá trình chuyển tiếp giữa một mục lịch sử và một mục khác. Nó không liên quan đến CSS transitions.

> [!NOTE]
> Bạn cũng có thể gọi {{domxref("Event.preventDefault", "preventDefault()")}} để dừng điều hướng hoàn toàn cho hầu hết [các loại điều hướng](/en-US/docs/Web/API/NavigateEvent/navigationType#value); việc hủy các điều hướng traverse vẫn chưa được triển khai.

Khi các promise trả về bởi các hàm trình xử lý `intercept()` được fulfill, sự kiện {{domxref("Navigation/navigatesuccess_event", "navigatesuccess")}} của đối tượng `Navigation` được kích hoạt, cho phép bạn chạy mã dọn dẹp sau khi một điều hướng thành công đã hoàn tất. Nếu chúng reject, nghĩa là điều hướng đã thất bại, {{domxref("Navigation/navigateerror_event", "navigateerror")}} được kích hoạt thay vào đó, cho phép bạn xử lý trường hợp thất bại một cách mượt mà. Cũng có một thuộc tính `finished` trên giá trị trả về của các phương thức điều hướng (chẳng hạn như {{domxref("Navigation.navigate()")}}), sẽ fulfill hoặc reject cùng thời điểm với các sự kiện aforementioned được kích hoạt, cung cấp một con đường khác để xử lý các trường hợp thành công và thất bại.

> [!NOTE]
> Trước khi Navigation API khả dụng, để làm điều tương tự, bạn phải lắng nghe tất cả các sự kiện nhấp chuột trên liên kết, chạy `e.preventDefault()`, thực hiện lệnh gọi {{domxref("History.pushState()")}} phù hợp, sau đó thiết lập chế độ xem trang dựa trên URL mới. Và điều này sẽ không xử lý được tất cả các điều hướng — chỉ các nhấp chuột liên kết do người dùng khởi tạo.

### Cập nhật và duyệt lịch sử điều hướng theo chương trình

Khi người dùng điều hướng qua ứng dụng của bạn, mỗi vị trí mới được điều hướng đến sẽ dẫn đến việc tạo một mục lịch sử điều hướng. Mỗi mục lịch sử được đại diện bởi một thực thể đối tượng {{domxref("NavigationHistoryEntry")}} riêng biệt. Chúng chứa một số thuộc tính như khóa, URL và thông tin trạng thái của mục. Bạn có thể lấy mục mà người dùng hiện đang truy cập bằng {{domxref("Navigation.currentEntry")}} và một mảng tất cả các mục lịch sử hiện có bằng {{domxref("Navigation.entries()")}}. Mỗi đối tượng `NavigationHistoryEntry` có một sự kiện {{domxref("NavigationHistoryEntry/dispose_event", "dispose")}}, được kích hoạt khi mục không còn là một phần của lịch sử trình duyệt. Ví dụ: nếu người dùng điều hướng lùi lại ba lần, sau đó điều hướng tiến đến một nơi khác, ba mục lịch sử đó sẽ bị hủy.

> [!NOTE]
> Navigation API chỉ hiển thị các mục lịch sử được tạo trong ngữ cảnh duyệt web hiện tại có cùng nguồn gốc với trang hiện tại (ví dụ: không phải điều hướng bên trong {{htmlelement("iframe")}} được nhúng hoặc điều hướng xuyên nguồn gốc), cung cấp một danh sách chính xác tất cả các mục lịch sử trước đó chỉ dành cho ứng dụng của bạn. Điều này làm cho việc duyệt lịch sử trở nên ít dễ vỡ hơn nhiều so với {{domxref("History API", "", "", "nocode")}} cũ.

Đối tượng `Navigation` chứa tất cả các phương thức bạn cần để cập nhật và duyệt qua lịch sử điều hướng:

- {{domxref("Navigation.navigate", "navigate()")}}
  - : Điều hướng đến một URL mới, tạo một mục lịch sử điều hướng mới.
- {{domxref("Navigation.reload", "reload()")}}
  - : Tải lại mục lịch sử điều hướng hiện tại.
- {{domxref("Navigation.back", "back()")}}
  - : Điều hướng đến mục lịch sử điều hướng trước đó, nếu có thể.
- {{domxref("Navigation.forward", "forward()")}}
  - : Điều hướng đến mục lịch sử điều hướng tiếp theo, nếu có thể.
- {{domxref("Navigation.traverseTo", "traverseTo()")}}
  - : Điều hướng đến một mục lịch sử điều hướng cụ thể được xác định bằng giá trị khóa của nó, thu được thông qua thuộc tính {{domxref("NavigationHistoryEntry.key")}} của mục liên quan.

Mỗi phương thức trên trả về một đối tượng chứa hai promise — `{ committed, finished }`. Điều này cho phép hàm gọi chờ đợi trước khi thực hiện hành động tiếp theo cho đến khi:

- `committed` được fulfill, nghĩa là URL hiển thị đã thay đổi và một {{domxref("NavigationHistoryEntry")}} mới đã được tạo.
- `finished` được fulfill, nghĩa là tất cả các promise trả về bởi các trình xử lý `intercept()` của bạn đã được fulfill. Điều này tương đương với promise {{domxref("NavigationTransition.finished")}} được fulfill, khi sự kiện {{domxref("Navigation/navigatesuccess_event", "navigatesuccess")}} được kích hoạt, như đã đề cập trước đó.
- một trong các promise trên reject, nghĩa là điều hướng đã thất bại vì lý do nào đó.

### Trạng thái

Navigation API cho phép bạn lưu trữ trạng thái trên mỗi mục lịch sử. Đây là thông tin do nhà phát triển định nghĩa — nó có thể là bất cứ thứ gì bạn muốn. Ví dụ: bạn có thể muốn lưu trữ một thuộc tính `visitCount` ghi lại số lần một chế độ xem đã được truy cập, hoặc một đối tượng chứa nhiều thuộc tính liên quan đến trạng thái giao diện người dùng, để trạng thái đó có thể được khôi phục khi người dùng quay lại chế độ xem đó.

Để lấy trạng thái của một {{domxref("NavigationHistoryEntry")}}, bạn gọi phương thức {{domxref("NavigationHistoryEntry.getState", "getState()")}} của nó. Ban đầu nó là `undefined`, nhưng khi thông tin trạng thái được đặt trên mục, nó sẽ trả về thông tin trạng thái đã đặt trước đó.

Việc đặt trạng thái tinh tế hơn một chút. Bạn không thể truy xuất giá trị trạng thái rồi cập nhật trực tiếp — bản sao được lưu trữ trên mục sẽ không thay đổi. Thay vào đó, bạn cập nhật nó trong khi thực hiện {{domxref("Navigation.navigate", "navigate()")}} hoặc {{domxref("Navigation.reload", "reload()")}} — mỗi phương thức này tùy ý nhận một tham số đối tượng tùy chọn, bao gồm một thuộc tính `state` chứa trạng thái mới để đặt trên mục lịch sử. Khi các điều hướng này được commit, thay đổi trạng thái sẽ được tự động áp dụng.

Tuy nhiên, trong một số trường hợp, thay đổi trạng thái sẽ độc lập với điều hướng hoặc tải lại — ví dụ khi một trang chứa phần tử {{htmlelement("details")}} có thể mở rộng/thu gọn. Trong trường hợp này, bạn có thể muốn lưu trữ trạng thái mở rộng/thu gọn trong mục lịch sử của mình, để bạn có thể khôi phục nó khi người dùng quay lại trang hoặc khởi động lại trình duyệt. Các trường hợp như vậy được xử lý bằng {{domxref("Navigation.updateCurrentEntry()")}}. Sự kiện {{domxref("Navigation/currententrychange_event", "currententrychange")}} sẽ được kích hoạt khi thay đổi mục hiện tại hoàn tất.

### Hạn chế

Có một số hạn chế được nhận thấy với Navigation API:

1. Đặc tả kỹ thuật hiện tại không kích hoạt sự kiện {{domxref("Navigation.navigate_event", "navigate")}} trong lần tải trang đầu tiên. Điều này có thể ổn đối với các trang web sử dụng Server Side Rendering (SSR)—máy chủ của bạn có thể trả về trạng thái ban đầu chính xác, đây là cách nhanh nhất để cung cấp nội dung cho người dùng. Nhưng các trang web sử dụng mã phía client để tạo trang của họ có thể cần một hàm bổ sung để khởi tạo trang.
2. Navigation API chỉ hoạt động trong một khung duy nhất—trang cấp cao nhất hoặc một {{htmlelement("iframe")}} cụ thể. Điều này có một số ý nghĩa thú vị được [tài liệu thêm trong đặc tả kỹ thuật](https://github.com/WICG/navigation-api#warning-backforward-are-not-always-opposites), nhưng trong thực tế sẽ giảm bớt sự nhầm lẫn của nhà phát triển. {{domxref("History API", "", "", "nocode")}} trước đó có một số trường hợp cạnh gây nhầm lẫn, như hỗ trợ cho các khung, mà Navigation API xử lý ngay từ đầu.
3. Hiện tại bạn không thể sử dụng Navigation API để sửa đổi hoặc sắp xếp lại danh sách lịch sử theo chương trình. Có thể hữu ích khi có một trạng thái tạm thời, ví dụ điều hướng người dùng đến một modal tạm thời yêu cầu họ cung cấp một số thông tin, sau đó quay lại URL trước đó. Trong trường hợp này, bạn sẽ muốn xóa mục điều hướng modal tạm thời để người dùng không thể làm rối luồng ứng dụng bằng cách nhấn nút tiến và mở lại nó.

## Các giao diện

- {{domxref("NavigateEvent")}} {{Experimental_Inline}}
  - : Đối tượng sự kiện cho sự kiện {{domxref("Navigation/navigate_event", "navigate")}}, được kích hoạt khi [bất kỳ loại điều hướng nào](https://github.com/WICG/navigation-api#appendix-types-of-navigations) được khởi tạo. Nó cung cấp quyền truy cập vào thông tin về điều hướng đó, và đáng chú ý nhất là {{domxref("NavigateEvent.intercept", "intercept()")}}, cho phép bạn kiểm soát điều gì xảy ra khi điều hướng được khởi tạo.
- {{domxref("Navigation")}} {{Experimental_Inline}}
  - : Cho phép kiểm soát tất cả các hành động điều hướng cho `window` hiện tại ở một vị trí trung tâm, bao gồm khởi tạo điều hướng theo chương trình, kiểm tra các mục lịch sử điều hướng và quản lý điều hướng khi chúng xảy ra.
- {{domxref("NavigationActivation")}} {{Experimental_Inline}}
  - : Đại diện cho một điều hướng xuyên tài liệu gần đây. Nó chứa loại điều hướng và các mục lịch sử tài liệu hiện tại và đích đến.
- {{domxref("NavigationCurrentEntryChangeEvent")}} {{Experimental_Inline}}
  - : Đối tượng sự kiện cho sự kiện {{domxref("Navigation/currententrychange_event", "currententrychange")}}, được kích hoạt khi {{domxref("Navigation.currentEntry")}} đã thay đổi. Nó cung cấp quyền truy cập vào loại điều hướng và mục lịch sử trước đó đã điều hướng từ đó.
- {{domxref("NavigationDestination")}} {{Experimental_Inline}}
  - : Đại diện cho đích đến đang được điều hướng đến trong điều hướng hiện tại.
- {{domxref("NavigationHistoryEntry")}} {{Experimental_Inline}}
  - : Đại diện cho một mục lịch sử điều hướng duy nhất.
- {{domxref("NavigationPrecommitController")}} {{Experimental_Inline}}
  - : Định nghĩa hành vi chuyển hướng cho trình xử lý precommit điều hướng, khi được truyền vào callback [`precommitHandler`](/en-US/docs/Web/API/NavigateEvent/intercept#precommithandler) của một lệnh gọi phương thức {{domxref("NavigateEvent.intercept()")}}.
- {{domxref("NavigationTransition")}} {{Experimental_Inline}}
  - : Đại diện cho một điều hướng đang diễn ra.

## Mở rộng cho các giao diện khác

- {{domxref("Window.navigation")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về đối tượng {{domxref("Navigation")}} liên kết của `window` hiện tại. Đây là điểm entry cho Navigation API.

## Ví dụ

> [!NOTE]
> Xem [bản demo trực tiếp Navigation API](https://mdn.github.io/dom-examples/navigation-api/) ([xem mã nguồn demo](https://github.com/mdn/dom-examples/tree/main/navigation-api)).

### Xử lý điều hướng bằng `intercept()`

```js
navigation.addEventListener("navigate", (event) => {
  // Chúng ta không thể chặn một số điều hướng, ví dụ: điều hướng xuyên nguồn gốc.
  // Trả về sớm và để trình duyệt xử lý bình thường.
  if (!event.canIntercept) {
    return;
  }

  // Chúng ta không nên chặn điều hướng đoạn mã hoặc tải xuống.
  if (event.hashChange || event.downloadRequest !== null) {
    return;
  }

  const url = new URL(event.destination.url);

  if (url.pathname.startsWith("/articles/")) {
    event.intercept({
      async handler() {
        // URL đã thay đổi, nên hiển thị placeholder trong khi
        // lấy nội dung mới, chẳng hạn như trang spinner hoặc đang tải
        renderArticlePagePlaceholder();

        // Lấy nội dung mới và hiển thị khi sẵn sàng
        const articleContent = await getArticleContent(url.pathname);
        renderArticlePage(articleContent);
      },
    });
  }
});
```

### Xử lý cuộn bằng `scroll()`

Trong ví dụ này về việc chặn điều hướng, hàm `handler()` bắt đầu bằng cách tìm nạp và hiển thị một số nội dung bài viết, nhưng sau đó tìm nạp và hiển thị một số nội dung phụ afterwards. Việc cuộn trang đến nội dung bài viết chính ngay khi nó khả dụng để người dùng có thể tương tác có ý nghĩa hơn là chờ đến khi nội dung phụ cũng được hiển thị. Để đạt được điều này, chúng ta đã thêm một lệnh gọi {{domxref("NavigateEvent.scroll", "scroll()")}} giữa hai phần.

```js
navigation.addEventListener("navigate", (event) => {
  // Trả về sớm nếu chúng ta không thể/không nên chặn
  if (
    !event.canIntercept ||
    event.hashChange ||
    event.downloadRequest !== null
  ) {
    return;
  }

  const url = new URL(event.destination.url);

  if (url.pathname.startsWith("/articles/")) {
    event.intercept({
      async handler() {
        const articleContent = await getArticleContent(url.pathname);
        renderArticlePage(articleContent);

        event.scroll();

        const secondaryContent = await getSecondaryContent(url.pathname);
        addSecondaryContent(secondaryContent);
      },
    });
  }
});
```

### Duyệt đến một mục lịch sử cụ thể

```js
// Khi JS khởi động, lấy khóa của trang được tải đầu tiên
// để người dùng luôn có thể quay lại đó.
const { key } = navigation.currentEntry;
backToHomeButton.onclick = () => navigation.traverseTo(key);

// Điều hướng đi nơi khác, nhưng nút sẽ luôn hoạt động.
await navigation.navigate("/another_url").finished;
```

### Cập nhật trạng thái

```js
navigation.navigate(url, { state: newState });
```

Hoặc

```js
navigation.reload({ state: newState });
```

Hoặc nếu trạng thái độc lập với điều hướng hoặc tải lại:

```js
navigation.updateCurrentEntry({ state: newState });
```

## Đặc điểm kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Định tuyến phía client hiện đại: Navigation API](https://developer.chrome.com/docs/web-platform/navigation-api/)
- [Giải thích Navigation API](https://github.com/WICG/navigation-api/blob/main/README.md)
