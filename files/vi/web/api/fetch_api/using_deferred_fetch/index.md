---
title: Sử dụng Deferred Fetch
slug: Web/API/Fetch_API/Using_Deferred_Fetch
page-type: guide
---

{{DefaultAPISidebar("Fetch API")}}

**API `fetchLater()`** cung cấp một giao diện để yêu cầu một deferred fetch, có thể được gửi sau một khoảng thời gian đã chỉ định, hoặc khi trang bị đóng hay điều hướng rời khỏi.

## Tổng quan

Các nhà phát triển thường cần gửi dữ liệu trở lại server, đặc biệt vào cuối một lượt truy cập của người dùng vào trang - ví dụ cho các dịch vụ phân tích. Có nhiều cách để làm việc này: từ thêm các phần tử {{HTMLElement("img")}} 1 pixel vào trang, tới {{domxref("XMLHttpRequest")}}, tới {{domxref("Beacon API", "Beacon API", "", "nocode")}} chuyên dụng, và cả chính {{domxref("Fetch API", "Fetch API", "", "nocode")}}.

Vấn đề là tất cả các phương pháp này đều gặp vấn đề về độ tin cậy khi beacon ở cuối phiên. Dù Beacon API và thuộc tính {{domxref("Request.keepalive", "keepalive")}} của Fetch API sẽ gửi dữ liệu ngay cả khi tài liệu bị hủy (trong phạm vi nỗ lực tốt nhất có thể trong tình huống đó), điều này chỉ giải quyết được một phần vấn đề.

Phần còn lại, khó hơn, là quyết định _khi nào_ nên gửi dữ liệu, vì không có thời điểm lý tưởng trong vòng đời của trang để thực hiện lời gọi JavaScript gửi beacon:

- Sự kiện {{domxref("Window.unload_event", "unload")}} và {{domxref("Window.beforeunload_event", "beforeunload")}} không đáng tin cậy, và thậm chí bị một số trình duyệt lớn bỏ qua hoàn toàn.
- Sự kiện {{domxref("Window.pagehide_event", "pagehide")}} và {{domxref("document.visibilitychange_event", "visibilitychange")}} đáng tin cậy hơn, nhưng vẫn có vấn đề trên nền tảng di động.

Điều này có nghĩa là các nhà phát triển muốn gửi dữ liệu bằng beacon một cách đáng tin cậy phải làm điều đó thường xuyên hơn mức lý tưởng. Ví dụ, họ có thể gửi beacon sau mỗi thay đổi, ngay cả khi giá trị cuối cùng cho trang chưa đạt tới. Điều này làm tăng chi phí về sử dụng mạng, xử lý phía server, và việc gộp hoặc loại bỏ các beacon cũ trên server.

Ngoài ra, nhà phát triển có thể chấp nhận một mức độ thiếu dữ liệu nào đó - bằng cách:

- Gửi beacon sau một thời điểm cắt đã định và không thu thập dữ liệu muộn hơn nữa.
- Gửi beacon ở cuối vòng đời trang nhưng chấp nhận rằng đôi khi việc này sẽ không đáng tin cậy.

API `fetchLater()` mở rộng {{domxref("Fetch API", "Fetch API", "", "nocode")}} để cho phép thiết lập trước các request fetch. Những deferred fetch này có thể được cập nhật trước khi chúng được gửi, cho phép payload phản ánh dữ liệu mới nhất cần được beacon.

Sau đó, trình duyệt sẽ gửi beacon khi tab bị đóng hoặc điều hướng rời đi, hoặc sau một khoảng thời gian đã đặt nếu có chỉ định. Điều này tránh phải gửi nhiều beacon nhưng vẫn bảo đảm một beacon đáng tin cậy trong phạm vi kỳ vọng hợp lý (tức là loại trừ trường hợp tiến trình trình duyệt bị tắt đột ngột trong một sự cố).

Deferred fetch cũng có thể bị hủy bằng {{domxref("AbortController")}} nếu chúng không còn cần thiết, giúp tránh các chi phí không cần thiết tiếp theo.

## Hạn mức

Deferred fetch được gom lại và gửi khi tab bị đóng; ở thời điểm đó, người dùng không còn cách nào để hủy chúng. Để tránh tình huống tài liệu lạm dụng băng thông này để gửi lượng dữ liệu không giới hạn qua mạng, hạn mức tổng cho một tài liệu cấp cao nhất bị giới hạn ở 640KiB.

Trong hầu hết các trường hợp, người gọi `fetchLater()` nên chủ động và bắt lỗi `QuotaExceededError`, đặc biệt nếu họ nhúng JavaScript của bên thứ ba.

Vì giới hạn này khiến băng thông deferred fetch trở thành một tài nguyên khan hiếm, cần được chia sẻ giữa nhiều origin báo cáo khác nhau (ví dụ nhiều thư viện RUM) và các subframe từ nhiều origin, nền tảng cung cấp một cách chia mặc định hợp lý cho hạn mức này. Ngoài ra, nó cung cấp các chỉ thị [Permissions Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy) {{HTTPHeader("Permissions-Policy/deferred-fetch", "deferred-fetch")}} và {{HTTPHeader("Permissions-Policy/deferred-fetch-minimal", "deferred-fetch-minimal")}} để cho phép chia khác đi khi cần.

Hạn mức tổng cho `fetchLater()` là 640KiB cho mỗi tài liệu. Theo mặc định, nó được chia thành hạn mức cấp cao nhất 512KiB và hạn mức dùng chung 128KiB:

- Hạn mức cấp cao nhất 512KiB mặc định dành cho mọi request `fetchLater()` được tạo từ tài liệu cấp cao nhất và các subframe trực tiếp dùng origin đó.
- Hạn mức dùng chung 128KiB mặc định dành cho mọi request `fetchLater()` được tạo trong các subframe khác origin (ví dụ `<iframe>`, `<object>`, `<embed>`, và `<frame>`).

Request `fetchLater()` có thể được gửi tới bất kỳ URL nào và không bị giới hạn ở cùng origin với tài liệu hay subframe, vì vậy cần phân biệt giữa các request được tạo trong nội dung tài liệu cấp cao nhất (dù là tới origin first-party hay third-party) và các request được tạo trong subframe.

Ví dụ, nếu một tài liệu cấp cao nhất `a.com` bao gồm một `<script>` thực hiện request `fetchLater()` tới `analytics.example.com`, request này sẽ chịu giới hạn 512KiB cấp cao nhất. Ngược lại, nếu tài liệu cấp cao nhất nhúng một `<iframe>` có nguồn là `analytics.example.com` và iframe đó thực hiện request `fetchLater()`, request đó sẽ chịu giới hạn 128KiB.

### Giới hạn hạn mức theo reporting origin và subframe

Chỉ có 64KiB trong hạn mức cấp cao nhất 512KiB được dùng đồng thời cho cùng một reporting origin (origin của request URL). Điều này ngăn các thư viện bên thứ ba chiếm giữ hạn mức trước khi họ có dữ liệu để gửi.

Mỗi cross-origin subframe nhận một hạn mức 8KiB từ hạn mức dùng chung 128KiB theo mặc định, được cấp khi subframe được thêm vào DOM (bất kể lúc đó subframe có dùng `fetchLater()` hay không). Điều này có nghĩa là, nhìn chung, chỉ 16 cross-origin subframe đầu tiên được thêm vào trang mới có thể dùng `fetchLater()`, vì chúng sẽ dùng hết hạn mức 128KiB.

### Tăng hạn mức subframe bằng cách chia sẻ hạn mức cấp cao nhất

Origin cấp cao nhất có thể cấp cho một số cross-origin subframe được chọn hạn mức tăng lên 64KiB, lấy từ giới hạn 512KiB lớn hơn của cấp cao nhất. Nó làm điều này bằng cách liệt kê các origin đó trong chỉ thị Permissions Policy {{HTTPHeader("Permissions-Policy/deferred-fetch", "deferred-fetch")}}. Hạn mức này được cấp khi subframe được thêm vào DOM, làm giảm hạn mức còn lại cho tài liệu cấp cao nhất và các same-origin subframe trực tiếp. Nhiều subdomain cùng origin có thể mỗi cái nhận hạn mức 64KiB.

### Hạn chế hạn mức dùng chung

Origin cấp cao nhất cũng có thể giới hạn hạn mức dùng chung 128KiB cho các cross-origin subframe được đặt tên bằng cách liệt kê các origin đó trong chỉ thị Permissions Policy {{HTTPHeader("Permissions-Policy/deferred-fetch-minimal", "deferred-fetch-minimal")}}. Nó cũng có thể thu hồi toàn bộ hạn mức subframe mặc định 128KiB và thay vào đó giữ toàn bộ 640KiB cho chính nó và bất kỳ cross-origin nào được chỉ định bằng `deferred-fetch`, bằng cách đặt Permissions Policy {{HTTPHeader("Permissions-Policy/deferred-fetch-minimal", "deferred-fetch-minimal")}} thành `()`.

### Ủy quyền hạn mức cho subframe của subframe

Theo mặc định, subframe của subframe không được cấp hạn mức nên không thể dùng `fetchLater()`. Các subframe được cấp hạn mức tăng 64KiB có thể ủy quyền toàn bộ hạn mức 64KiB của chúng cho các subframe sâu hơn và cho phép chúng dùng `fetchLater()` bằng cách đặt Permissions Policy `deferred-fetch` riêng. Chúng chỉ có thể ủy quyền toàn bộ hạn mức của mình cho các subframe sâu hơn, không thể ủy quyền từng phần, và không thể chỉ định hạn mức mới. Các subframe dùng hạn mức tối thiểu 8KiB không thể ủy quyền hạn mức cho subframe. Để được ủy quyền hạn mức, sub-subframe phải có mặt trong cả chỉ thị `deferred-fetch` của cấp cao nhất lẫn của subframe.

### Khi vượt hạn mức

Khi hạn mức bị vượt, `QuotaExceededError` sẽ được ném ra khi phương thức {{domxref('Window.fetchLater()','fetchLater()')}} được gọi để khởi tạo deferred request.

Kiểm tra Permissions Policy không thể phân biệt được với kiểm tra hạn mức. Việc gọi `fetchLater()` sẽ ném `QuotaExceededError` cả khi hạn mức thực sự bị vượt và khi hạn mức đã bị giới hạn cho origin đó thông qua Permissions Policy.

Trong hầu hết các trường hợp, người gọi `fetchLater()` nên chủ động và bắt lỗi `QuotaExceededError`, đặc biệt nếu họ nhúng JavaScript của bên thứ ba.

## Ví dụ về hạn mức

### Dùng hết hạn mức tối thiểu

```http
Permissions-Policy: deferred-fetch=(self "https://b.com")
```

1. `<iframe src="https://b.com/page">` nhận 64KiB khi được thêm vào tài liệu cấp cao nhất, từ giới hạn 512KiB của cấp cao nhất.
2. `<iframe src="https://c.com/page">` không được liệt kê nên nhận 8KiB khi được thêm vào tài liệu cấp cao nhất từ giới hạn dùng chung 128KiB.
3. 15 iframe khác origin tiếp theo mỗi iframe sẽ nhận 8KiB khi được thêm vào tài liệu cấp cao nhất (tương tự `c.com`).
4. Iframe cross-origin tiếp theo sẽ không được cấp bất kỳ hạn mức nào.
5. Nếu một trong các iframe cross-origin bị gỡ bỏ, các deferred fetch của nó sẽ được gửi đi.
6. Iframe cross-origin tiếp theo _sẽ_ nhận hạn mức 8KiB, vì lại có hạn mức khả dụng.

### Thu hồi việc giới hạn hạn mức tối thiểu cho các origin được đặt tên

```http
Permissions-Policy: deferred-fetch-minimal=("https://b.com")
```

1. `<iframe src="https://b.com/page">` nhận 8KiB khi được thêm vào tài liệu cấp cao nhất.
2. `<iframe src="https://c.com/page">` không nhận hạn mức khi được thêm vào tài liệu cấp cao nhất.
3. Tài liệu cấp cao nhất và các hậu duệ cùng origin của nó có thể dùng tối đa 512KiB.

### Thu hồi hoàn toàn hạn mức tối thiểu với các ngoại lệ cấp cao nhất

```http
Permissions-Policy: deferred-fetch=(self "https://b.com")
Permissions-Policy: deferred-fetch-minimal=()
```

1. `<iframe src="https://b.com/page">` nhận 64KiB khi được thêm vào tài liệu cấp cao nhất.
2. `<iframe src="https://c.com/page">` không nhận hạn mức khi được thêm vào tài liệu cấp cao nhất.
3. Tài liệu cấp cao nhất và các hậu duệ cùng origin của nó có thể dùng tối đa toàn bộ 640KiB, nhưng con số này giảm còn 574KiB nếu tạo một subframe `b.com` (hoặc còn ít hơn nếu tạo nhiều subframe `b.com`, mỗi cái được cấp hạn mức 64KiB).

### Thu hồi hoàn toàn hạn mức tối thiểu mà không có ngoại lệ

```http
Permissions-Policy: deferred-fetch-minimal=()
```

1. Tài liệu cấp cao nhất và các hậu duệ cùng origin của nó có thể dùng toàn bộ 640KiB.
2. Các subframe không được cấp bất kỳ hạn mức nào và không thể dùng `fetchLater()`.

### Các same-origin subframe chia sẻ hạn mức với cấp cao nhất và có thể ủy quyền cho subframe

Giả sử một tài liệu cấp cao nhất trên `a.com`, nhúng một subframe của `a.com`, rồi nhúng tiếp một subframe của `b.com`, và không có Permissions Policy rõ ràng.

1. Tài liệu cấp cao nhất của `a.com` có hạn mức mặc định 512KiB.
2. `<iframe src="https://a.com/embed">` chia sẻ hạn mức 512KiB khi được thêm vào tài liệu cấp cao nhất.
3. `<iframe src="https://b.com/embed">` nhận hạn mức 8KiB khi được thêm vào tài liệu cấp cao nhất.

### Same-origin subframe không thể chia sẻ hạn mức với cấp cao nhất khi bị ngăn cách bởi cross-origin subframe

Giả sử một tài liệu cấp cao nhất trên `a.com`, nhúng một `<iframe src="https://b.com/">`, rồi nhúng một subframe của `<iframe src="https://a.com/embed">`, và không có Permissions Policy rõ ràng.

1. Tài liệu cấp cao nhất của `a.com` có hạn mức mặc định 512KiB.
2. `<iframe src="https://b.com/">` chia sẻ hạn mức 8KiB.
3. `<iframe src="https://a.com/embed">` không nhận hạn mức; dù cùng origin với origin cấp cao nhất, nó bị ngăn cách bởi một cross-origin.

### Các subframe cấp hai của subframe không nhận hạn mức theo mặc định

Giả sử một tài liệu cấp cao nhất trên `a.com`, nhúng một `<iframe src="https://b.com/">`, rồi nhúng một `<iframe src="https://c.com/">`, và không có Permissions Policy rõ ràng.

1. Khung cấp cao nhất của `a.com` có hạn mức mặc định 512KiB.
2. `<iframe src="https://b.com/">` nhận 8KiB từ hạn mức dùng chung mặc định.
3. `<iframe src="https://c.com/">` không nhận hạn mức.

### Cấp toàn bộ hạn mức cho một subframe sâu hơn

Giả sử một tài liệu cấp cao nhất trên `a.com`, nhúng một `<iframe src="https://b.com/">`, rồi nhúng một `<iframe src="https://c.com/">`.

Giả sử `a.com` có Permissions Policy sau:

```http
Permissions-Policy: deferred-fetch=("https://c.com" "https://c.com")
```

Và giả sử `b.com` có Permissions Policy sau:

```http
Permissions-Policy: deferred-fetch=("https://c.com")
```

1. Khung cấp cao nhất của `a.com` có hạn mức mặc định 512KiB.
2. `<iframe src="https://b.com/">` nhận 64KiB của hạn mức mặc định.
3. `<iframe src="https://b.com/">` ủy quyền toàn bộ 8KiB hạn mức của nó cho `c.com`. `b.com` không thể dùng `fetchLater()`.
4. `<iframe src="https://c.com/">` nhận hạn mức 8KiB.

### Redirect không chuyển hạn mức

Giả sử một tài liệu cấp cao nhất trên `a.com`, nhúng một `<iframe src="https://b.com/">`, rồi redirect sang `c.com`, và không có Permissions Policy cấp cao nhất rõ ràng.

1. Khung cấp cao nhất của `a.com` có hạn mức mặc định 512KiB.
2. `<iframe src="https://b.com/">` nhận 8KiB của hạn mức dùng chung mặc định.
3. 8KiB đó không được chuyển sang `c.com` khi `<iframe src="https://b.com/">` redirect tới đó, nhưng 8KiB cũng không được giải phóng.

### Iframe sandbox cùng origin về mặt hiệu lực là origin riêng biệt

Ví dụ, nếu iframe sau được nhúng trên `https://www.example.com`:

```html
<iframe src="https://www.example.com/iframe" sandbox="allow-scripts"></iframe>
```

Nó sẽ không được xem là "same-origin", mặc dù được lưu trữ cùng origin với tài liệu cấp cao nhất, vì iframe nằm trong môi trường sandbox. Do đó, theo mặc định, nó sẽ được cấp hạn mức 8KiB từ tổng hạn mức dùng chung 128KiB.

### Không cho phép `fetchLater()` từ iframe

Bạn có thể dùng thuộc tính [`allow`](/en-US/docs/Web/HTML/Reference/Elements/iframe#allow) của `<iframe>` để ngăn hạn mức `fetchLater()` được cấp cho `<iframe>`:

```html
<iframe
  src="https://www.example.com/iframe"
  allow="deferred-fetch;deferred-fetch-minimal;"></iframe>
```

Chỉ thị `allow="deferred-fetch"` cần thiết để ngăn same-origin iframe sử dụng hạn mức 512KiB, và chỉ thị `allow="deferred-fetch-minimal"` cần thiết để ngăn cross-origin iframe sử dụng hạn mức 128KiB. Bao gồm cả hai chỉ thị sẽ ngăn cả hai hạn mức được sử dụng, bất kể giá trị `src`.

### Ví dụ gây ra `QuotaExceededError`

```js
// Maximum of 64KiB per origin
const url = "<72KiB of characters>";
fetchLater(url);

// Maximum of 64KiB per origin including headers
fetchLater("https://origin.example.com", { headers: headersExceeding64KiB });

// Maximum of 64KiB per origin including body and headers
fetchLater("<32KiB of characters>", { headers: headersExceeding32KiB });

// Maximum of 64KiB per origin including body
fetchLater("https://origin.example.com", {
  method: "POST",
  body: bodyExceeding64KiB,
});

// Maximum of 64KiB per origin including body and automatically added headers
fetchLater("<62KiB of characters>" /* with a 3kb referrer */);
```

### Ví dụ cuối cùng sẽ ném `QuotaExceededError`

Trong chuỗi sau, nằm trong tài liệu cấp cao nhất, hai request đầu tiên sẽ thành công, nhưng request thứ ba sẽ ném. Đó là vì, dù hạn mức tổng 640KiB chưa bị vượt, request thứ ba vượt quá hạn mức reporting-origin cho `https://a.example.com` và sẽ ném.

```js
fetchLater("https://a.example.com", { method: "POST", body: a40KiBBody });
fetchLater("https://b.example.com", { method: "POST", body: a40KiBBody });
fetchLater("https://a.example.com", { method: "POST", body: a40KiBBody });
```

### Redirect của subframe về origin cấp cao nhất cho phép dùng lại hạn mức cấp cao nhất

Giả sử một tài liệu cấp cao nhất ở `a.com`, nhúng `<iframe src="https://b.com/">`, rồi redirect sang `a.com`, và không có Permissions Policy cấp cao nhất rõ ràng:

1. Khung cấp cao nhất của `a.com` có hạn mức mặc định 512KiB.
2. `<iframe src="https://b.com/">` nhận 8KiB từ hạn mức dùng chung mặc định 128KiB.
3. 8KiB đó không được chuyển sang `a.com` khi `<iframe src="https://b.com/">` redirect tới đó, nhưng nó có thể lại chia sẻ toàn bộ hạn mức cấp cao nhất, và hạn mức 8KiB đã cấp trước đó sẽ được giải phóng.
