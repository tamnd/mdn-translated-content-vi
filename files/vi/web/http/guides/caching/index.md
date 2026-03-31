---
title: Bộ nhớ đệm HTTP
slug: Web/HTTP/Guides/Caching
page-type: guide
sidebar: http
---

Bộ nhớ đệm HTTP lưu trữ một phản hồi liên kết với yêu cầu và tái sử dụng phản hồi đã lưu trữ cho các yêu cầu tiếp theo.

Có một số ưu điểm của khả năng tái sử dụng. Đầu tiên, vì không cần chuyển yêu cầu đến máy chủ nguồn, thì client và bộ nhớ đệm càng gần nhau, phản hồi sẽ càng nhanh. Ví dụ điển hình nhất là khi chính trình duyệt lưu trữ bộ nhớ đệm cho các yêu cầu của trình duyệt.

Ngoài ra, khi một phản hồi có thể tái sử dụng, máy chủ nguồn không cần xử lý yêu cầu — vì vậy không cần phân tích cú pháp và định tuyến yêu cầu, khôi phục phiên dựa trên cookie, truy vấn DB để lấy kết quả, hoặc render template engine. Điều đó giảm tải cho máy chủ.

Hoạt động đúng đắn của bộ nhớ đệm rất quan trọng đối với sức khỏe của hệ thống.

## Các loại bộ nhớ đệm

Trong thông số kỹ thuật [HTTP Caching](https://httpwg.org/specs/rfc9111.html), có hai loại bộ nhớ đệm chính: **bộ nhớ đệm riêng tư** và **bộ nhớ đệm chia sẻ**.

### Bộ nhớ đệm riêng tư

Bộ nhớ đệm riêng tư là bộ nhớ đệm gắn với một client cụ thể — thường là bộ nhớ đệm trình duyệt. Vì phản hồi được lưu trữ không được chia sẻ với các client khác, bộ nhớ đệm riêng tư có thể lưu trữ phản hồi được cá nhân hóa cho người dùng đó.

Mặt khác, nếu nội dung được cá nhân hóa được lưu trữ trong bộ nhớ đệm khác ngoài bộ nhớ đệm riêng tư, thì các người dùng khác có thể truy xuất nội dung đó — điều này có thể gây ra rò rỉ thông tin không cố ý.

Nếu một phản hồi chứa nội dung được cá nhân hóa và bạn muốn chỉ lưu trữ phản hồi trong bộ nhớ đệm riêng tư, bạn phải chỉ định chỉ thị `private`.

```http
Cache-Control: private
```

Nội dung được cá nhân hóa thường được kiểm soát bởi cookie, nhưng sự hiện diện của cookie không phải lúc nào cũng cho thấy nó là riêng tư, do đó một cookie đơn thuần không làm cho phản hồi trở nên riêng tư.

### Bộ nhớ đệm chia sẻ

Bộ nhớ đệm chia sẻ nằm giữa client và máy chủ và có thể lưu trữ các phản hồi có thể được chia sẻ giữa các người dùng. Và bộ nhớ đệm chia sẻ có thể được phân loại thêm thành **bộ nhớ đệm proxy** và **bộ nhớ đệm được quản lý**.

#### Bộ nhớ đệm proxy

Ngoài chức năng kiểm soát truy cập, một số proxy triển khai bộ nhớ đệm để giảm lưu lượng ra khỏi mạng. Điều này thường không được quản lý bởi nhà phát triển dịch vụ, vì vậy nó phải được kiểm soát bởi các tiêu đề HTTP phù hợp và các cách khác. Tuy nhiên, trong quá khứ, các triển khai proxy-cache lỗi thời — chẳng hạn như các triển khai không hiểu đúng tiêu chuẩn HTTP Caching — thường gây ra vấn đề cho các nhà phát triển.

Các **tiêu đề kitchen-sink** như sau được sử dụng để cố gắng giải quyết các triển khai "proxy cache cũ và không được cập nhật" không hiểu các chỉ thị thông số kỹ thuật HTTP Caching hiện tại như `no-store`.

```http
Cache-Control: no-store, no-cache, max-age=0, must-revalidate, proxy-revalidate
```

Tuy nhiên, trong những năm gần đây, khi HTTPS ngày càng phổ biến và giao tiếp client/server được mã hóa, các proxy bộ nhớ đệm trên đường dẫn chỉ có thể đường hầm phản hồi và không thể hoạt động như bộ nhớ đệm, trong nhiều trường hợp. Vì vậy trong tình huống đó, không cần lo lắng về các triển khai proxy cache lỗi thời không thể thậm chí thấy phản hồi.

Mặt khác, nếu proxy TLS bridge giải mã tất cả giao tiếp theo cách người trung gian bằng cách cài đặt chứng chỉ từ {{Glossary("Certificate_authority", "CA (cơ quan chứng nhận)")}} được quản lý bởi tổ chức trên PC, và thực hiện kiểm soát truy cập, v.v. — có thể xem nội dung của phản hồi và lưu vào bộ nhớ đệm. Tuy nhiên, vì [CT (minh bạch chứng chỉ)](/en-US/docs/Web/Security/Defenses/Certificate_Transparency) đã trở nên phổ biến trong những năm gần đây, và một số trình duyệt chỉ cho phép chứng chỉ được cấp bằng SCT (dấu thời gian chứng chỉ đã ký), phương pháp này yêu cầu áp dụng chính sách doanh nghiệp. Trong môi trường được kiểm soát như vậy, không cần lo lắng về proxy cache "lỗi thời và không được cập nhật".

#### Bộ nhớ đệm được quản lý

Bộ nhớ đệm được quản lý được triển khai rõ ràng bởi các nhà phát triển dịch vụ để giảm tải máy chủ nguồn và cung cấp nội dung hiệu quả. Các ví dụ bao gồm reverse proxy, CDN, và service worker kết hợp với Cache API.

Đặc điểm của bộ nhớ đệm được quản lý khác nhau tùy thuộc vào sản phẩm được triển khai. Trong hầu hết các trường hợp, bạn có thể kiểm soát hành vi của bộ nhớ đệm thông qua tiêu đề `Cache-Control` và các tệp cấu hình hoặc bảng điều khiển của riêng bạn.

Ví dụ, thông số kỹ thuật HTTP Caching về cơ bản không định nghĩa cách để xóa rõ ràng bộ nhớ đệm — nhưng với bộ nhớ đệm được quản lý, phản hồi đã lưu trữ có thể bị xóa bất kỳ lúc nào thông qua các thao tác bảng điều khiển, gọi API, khởi động lại, và vân vân. Điều đó cho phép chiến lược bộ nhớ đệm chủ động hơn.

Cũng có thể bỏ qua các giao thức thông số kỹ thuật HTTP Caching chuẩn để ủng hộ thao tác rõ ràng. Ví dụ, có thể chỉ định những điều sau để bỏ qua bộ nhớ đệm riêng tư hoặc bộ nhớ đệm proxy, trong khi sử dụng chiến lược của riêng bạn để chỉ lưu vào bộ nhớ đệm được quản lý.

```http
Cache-Control: no-store
```

Ví dụ, Varnish Cache sử dụng logic VCL (Varnish Configuration Language, một loại {{Glossary("DSL/Domain_specific_language", "DSL")}}) để xử lý lưu trữ bộ nhớ đệm, trong khi service worker kết hợp với Cache API cho phép bạn tạo logic đó trong JavaScript.

Điều đó có nghĩa là nếu bộ nhớ đệm được quản lý cố ý bỏ qua chỉ thị `no-store`, không cần coi nó là "không tuân thủ" tiêu chuẩn. Điều bạn nên làm là tránh sử dụng các tiêu đề kitchen-sink, nhưng đọc cẩn thận tài liệu của bất kỳ cơ chế bộ nhớ đệm được quản lý nào bạn đang sử dụng, và đảm bảo bạn đang kiểm soát bộ nhớ đệm đúng cách theo các phương thức được cung cấp bởi cơ chế bạn đã chọn sử dụng.

Lưu ý rằng một số CDN cung cấp các tiêu đề riêng của họ chỉ có hiệu lực cho CDN đó (ví dụ: `Surrogate-Control`). Hiện tại, có công việc đang tiến hành để định nghĩa tiêu đề [`CDN-Cache-Control`](https://httpwg.org/specs/rfc9213.html) để chuẩn hóa những tiêu đề đó.

![Các loại bộ nhớ đệm, bao gồm bộ nhớ đệm riêng tư trong trình duyệt, bộ nhớ đệm chia sẻ (proxy), bộ nhớ đệm reverse proxy, và bộ nhớ đệm chia sẻ (được quản lý) trong CDN, dẫn đến bộ nhớ đệm của máy chủ nguồn](https://mdn.github.io/shared-assets/images/diagrams/http/cache/type-of-cache.svg)

## Bộ nhớ đệm theo phỏng đoán

HTTP được thiết kế để lưu vào bộ nhớ đệm nhiều nhất có thể, vì vậy ngay cả khi không có `Cache-Control` nào được cung cấp, các phản hồi sẽ được lưu trữ và tái sử dụng nếu đáp ứng các điều kiện nhất định. Điều này được gọi là **bộ nhớ đệm theo phỏng đoán**.

Ví dụ, lấy phản hồi sau. Phản hồi này được cập nhật lần cuối cách đây 1 năm.

```http
HTTP/1.1 200 OK
Content-Type: text/html
Content-Length: 1024
Date: Tue, 22 Feb 2022 22:22:22 GMT
Last-Modified: Tue, 22 Feb 2021 22:22:22 GMT

<!doctype html>
…
```

Phỏng đoán biết rằng nội dung chưa được cập nhật trong một năm đầy đủ sẽ không được cập nhật trong một thời gian sau đó. Do đó, client lưu trữ phản hồi này (mặc dù không có `max-age`) và tái sử dụng nó trong một thời gian. Thời gian tái sử dụng phụ thuộc vào triển khai, nhưng thông số kỹ thuật khuyến nghị khoảng 10% (trong trường hợp này là 0,1 năm) thời gian sau khi lưu trữ.

Bộ nhớ đệm theo phỏng đoán là biện pháp giải quyết trước khi hỗ trợ `Cache-Control` được áp dụng rộng rãi, và về cơ bản tất cả các phản hồi nên chỉ định rõ ràng tiêu đề `Cache-Control`.

## Mới và cũ dựa trên tuổi

Các phản hồi HTTP được lưu trữ có hai trạng thái: **mới** và **cũ**. Trạng thái _mới_ thường cho biết phản hồi vẫn còn hợp lệ và có thể tái sử dụng, trong khi trạng thái _cũ_ có nghĩa là phản hồi được lưu vào bộ nhớ đệm đã hết hạn.

Tiêu chí để xác định khi nào phản hồi mới và khi nào cũ là **tuổi**. Trong HTTP, tuổi là thời gian đã trôi qua kể từ khi phản hồi được tạo ra. Điều này tương tự như {{Glossary("TTL")}} trong các cơ chế bộ nhớ đệm khác.

Lấy ví dụ phản hồi sau (604800 giây là một tuần):

```http
HTTP/1.1 200 OK
Content-Type: text/html
Content-Length: 1024
Date: Tue, 22 Feb 2022 22:22:22 GMT
Cache-Control: max-age=604800

<!doctype html>
…
```

Bộ nhớ đệm lưu trữ phản hồi ví dụ tính thời gian đã trôi qua kể từ khi phản hồi được tạo ra và sử dụng kết quả làm _tuổi_ của phản hồi.

Đối với phản hồi ví dụ, ý nghĩa của `max-age` như sau:

- Nếu tuổi của phản hồi _ít hơn_ một tuần, phản hồi là _mới_.
- Nếu tuổi của phản hồi _nhiều hơn_ một tuần, phản hồi là _cũ_.

Miễn là phản hồi được lưu trữ vẫn còn mới, nó sẽ được sử dụng để đáp ứng các yêu cầu của client.

Khi một phản hồi được lưu trữ trong bộ nhớ đệm chia sẻ, có thể cho client biết tuổi của phản hồi. Tiếp tục với ví dụ, nếu bộ nhớ đệm chia sẻ đã lưu trữ phản hồi trong một ngày, bộ nhớ đệm chia sẻ sẽ gửi phản hồi sau cho các yêu cầu client tiếp theo.

```http
HTTP/1.1 200 OK
Content-Type: text/html
Content-Length: 1024
Date: Tue, 22 Feb 2022 22:22:22 GMT
Cache-Control: max-age=604800
Age: 86400

<!doctype html>
…
```

Client nhận phản hồi đó sẽ thấy nó mới trong 518400 giây còn lại, chênh lệch giữa `max-age` và `Age` của phản hồi.

## Expires hoặc max-age

Trong HTTP/1.0, độ tươi mới được chỉ định bởi tiêu đề `Expires`.

Tiêu đề `Expires` chỉ định thời gian tồn tại của bộ nhớ đệm bằng cách sử dụng thời gian rõ ràng thay vì chỉ định thời gian đã trôi qua.

```http
Expires: Tue, 28 Feb 2022 22:22:22 GMT
```

Tuy nhiên, định dạng thời gian khó phân tích cú pháp, đã tìm thấy nhiều lỗi triển khai, và có thể gây ra vấn đề bằng cách cố ý dịch chuyển đồng hồ hệ thống; do đó, `max-age` — để chỉ định thời gian đã trôi qua — đã được áp dụng cho `Cache-Control` trong HTTP/1.1.

Nếu cả `Expires` và `Cache-Control: max-age` đều có sẵn, `max-age` được định nghĩa là ưu tiên hơn. Vì vậy không cần cung cấp `Expires` bây giờ khi HTTP/1.1 được sử dụng rộng rãi.

## Vary

Cách các phản hồi được phân biệt với nhau về cơ bản dựa trên URL của chúng:

| URL                              | Nội dung phản hồi        |
| -------------------------------- | ------------------------ |
| `https://example.com/index.html` | `<!doctype html>...`     |
| `https://example.com/style.css`  | `body { ...`             |
| `https://example.com/script.js`  | `function main () { ...` |

Nhưng nội dung của các phản hồi không phải lúc nào cũng giống nhau, ngay cả khi chúng có cùng URL. Đặc biệt khi thương lượng nội dung được thực hiện, phản hồi từ máy chủ có thể phụ thuộc vào các giá trị của các tiêu đề yêu cầu `Accept`, `Accept-Language`, và `Accept-Encoding`.

Ví dụ, đối với nội dung tiếng Anh được trả về với tiêu đề `Accept-Language: en` và được lưu vào bộ nhớ đệm, không nên tái sử dụng phản hồi được lưu vào bộ nhớ đệm đó cho các yêu cầu có tiêu đề yêu cầu `Accept-Language: ja`. Trong trường hợp này, bạn có thể khiến các phản hồi được lưu vào bộ nhớ đệm riêng biệt — dựa trên ngôn ngữ — bằng cách thêm `Accept-Language` vào giá trị của tiêu đề `Vary`.

```http
Vary: Accept-Language
```

Điều đó khiến bộ nhớ đệm được khóa dựa trên một tổ hợp URL phản hồi và tiêu đề yêu cầu `Accept-Language` — thay vì chỉ dựa trên URL phản hồi.

| URL                              | `Accept-Language` | Nội dung phản hồi        |
| -------------------------------- | ----------------- | ------------------------ |
| `https://example.com/index.html` | `ja-JP`           | `<!doctype html>...`     |
| `https://example.com/index.html` | `en-US`           | `<!doctype html>...`     |
| `https://example.com/style.css`  | `ja-JP`           | `body { ...`             |
| `https://example.com/script.js`  | `ja-JP`           | `function main () { ...` |

Ngoài ra, nếu bạn đang cung cấp tối ưu hóa nội dung (ví dụ: cho thiết kế phản hồi) dựa trên user agent, bạn có thể bị cám dỗ đưa `User-Agent` vào giá trị của tiêu đề `Vary`. Tuy nhiên, tiêu đề yêu cầu `User-Agent` thường có rất nhiều biến thể, điều này giảm đáng kể khả năng bộ nhớ đệm sẽ được tái sử dụng. Vì vậy nếu có thể, thay vào đó hãy xem xét một cách để thay đổi hành vi dựa trên phát hiện tính năng thay vì dựa trên tiêu đề yêu cầu `User-Agent`.

Đối với các ứng dụng sử dụng cookie để ngăn người khác tái sử dụng nội dung được cá nhân hóa đã lưu vào bộ nhớ đệm, bạn nên chỉ định `Cache-Control: private` thay vì chỉ định cookie cho `Vary`.

## Xác nhận

Các phản hồi cũ không bị loại bỏ ngay lập tức. HTTP có cơ chế để chuyển đổi phản hồi cũ thành mới bằng cách hỏi máy chủ nguồn. Điều này được gọi là **xác nhận**, hoặc đôi khi là **xác nhận lại**.

Xác nhận được thực hiện bằng cách sử dụng **yêu cầu có điều kiện** bao gồm tiêu đề yêu cầu `If-Modified-Since` hoặc `If-None-Match`.

### If-Modified-Since

Phản hồi sau được tạo lúc 22:22:22 và có `max-age` là 1 giờ, vì vậy bạn biết rằng nó mới đến 23:22:22.

```http
HTTP/1.1 200 OK
Content-Type: text/html
Content-Length: 1024
Date: Tue, 22 Feb 2022 22:22:22 GMT
Last-Modified: Tue, 22 Feb 2022 22:00:00 GMT
Cache-Control: max-age=3600

<!doctype html>
…
```

Lúc 23:22:22, phản hồi trở nên cũ và bộ nhớ đệm không thể được tái sử dụng. Vì vậy yêu cầu bên dưới cho thấy client gửi yêu cầu với tiêu đề yêu cầu `If-Modified-Since`, để hỏi máy chủ xem có bất kỳ thay đổi nào được thực hiện kể từ thời gian được chỉ định hay không.

```http
GET /index.html HTTP/1.1
Host: example.com
Accept: text/html
If-Modified-Since: Tue, 22 Feb 2022 22:00:00 GMT
```

Máy chủ sẽ phản hồi bằng `304 Not Modified` nếu nội dung không thay đổi kể từ thời gian được chỉ định.

Vì phản hồi này chỉ cho biết "không có thay đổi", không có nội dung phản hồi — chỉ có mã trạng thái — vì vậy kích thước truyền tải cực kỳ nhỏ.

```http
HTTP/1.1 304 Not Modified
Content-Type: text/html
Date: Tue, 22 Feb 2022 23:22:22 GMT
Last-Modified: Tue, 22 Feb 2022 22:00:00 GMT
Cache-Control: max-age=3600
```

Khi nhận được phản hồi đó, client chuyển đổi phản hồi cũ đã lưu trữ trở lại thành mới và có thể tái sử dụng nó trong 1 giờ còn lại.

Máy chủ có thể lấy thời gian sửa đổi từ hệ thống tệp hệ điều hành, điều này tương đối dễ dàng để thực hiện trong trường hợp phục vụ các tệp tĩnh. Tuy nhiên, có một số vấn đề; ví dụ, định dạng thời gian phức tạp và khó phân tích cú pháp, và các máy chủ phân tán gặp khó khăn trong việc đồng bộ hóa thời gian cập nhật tệp.

Để giải quyết các vấn đề như vậy, tiêu đề phản hồi `ETag` đã được chuẩn hóa như một giải pháp thay thế.

### ETag/If-None-Match

Giá trị của tiêu đề phản hồi `ETag` là một giá trị tùy ý được tạo bởi máy chủ. Không có hạn chế về cách máy chủ phải tạo ra giá trị, vì vậy máy chủ có thể tự do đặt giá trị dựa trên bất kỳ phương tiện nào họ chọn — chẳng hạn như băm nội dung hoặc số phiên bản.

Ví dụ, nếu giá trị băm được sử dụng cho tiêu đề `ETag` và giá trị băm của tài nguyên `index.html` là `33a64df5`, phản hồi sẽ như sau:

```http
HTTP/1.1 200 OK
Content-Type: text/html
Content-Length: 1024
Date: Tue, 22 Feb 2022 22:22:22 GMT
ETag: "33a64df5"
Cache-Control: max-age=3600

<!doctype html>
…
```

Nếu phản hồi đó trở nên cũ, client lấy giá trị của tiêu đề phản hồi `ETag` cho phản hồi đã lưu vào bộ nhớ đệm, và đặt nó vào tiêu đề yêu cầu `If-None-Match`, để hỏi máy chủ xem tài nguyên có được sửa đổi hay không:

```http
GET /index.html HTTP/1.1
Host: example.com
Accept: text/html
If-None-Match: "33a64df5"
```

Máy chủ sẽ trả về `304 Not Modified` nếu giá trị của tiêu đề `ETag` mà nó xác định cho tài nguyên được yêu cầu giống với giá trị `If-None-Match` trong yêu cầu.

Nhưng nếu máy chủ xác định rằng tài nguyên được yêu cầu bây giờ có giá trị `ETag` khác, máy chủ sẽ phản hồi bằng `200 OK` và phiên bản mới nhất của tài nguyên.

> [!NOTE]
> RFC9110 ưu tiên các máy chủ gửi cả `ETag` và `Last-Modified` cho phản hồi `200` nếu có thể.
> Trong quá trình xác nhận lại bộ nhớ đệm, nếu cả `If-Modified-Since` và `If-None-Match` đều có mặt, thì `If-None-Match` sẽ được ưu tiên cho bộ xác nhận.
> Nếu bạn chỉ xem xét bộ nhớ đệm, bạn có thể nghĩ rằng `Last-Modified` là không cần thiết.
> Tuy nhiên, `Last-Modified` không chỉ hữu ích cho bộ nhớ đệm; đây là tiêu đề HTTP chuẩn cũng được sử dụng bởi các hệ thống quản lý nội dung (CMS) để hiển thị thời gian sửa đổi lần cuối, bởi các crawler để điều chỉnh tần suất thu thập thông tin, và cho các mục đích khác nhau khác.
> Vì vậy xem xét hệ sinh thái HTTP tổng thể, tốt hơn là cung cấp cả `ETag` và `Last-Modified`.

### Buộc xác nhận lại

Nếu bạn không muốn phản hồi được tái sử dụng, mà thay vào đó muốn luôn tải nội dung mới nhất từ máy chủ, bạn có thể sử dụng chỉ thị `no-cache` để buộc xác nhận.

Bằng cách thêm `Cache-Control: no-cache` vào phản hồi cùng với `Last-Modified` và `ETag` — như được hiển thị bên dưới — client sẽ nhận được phản hồi `200 OK` nếu tài nguyên được yêu cầu đã được cập nhật, hoặc sẽ nhận được phản hồi `304 Not Modified` nếu tài nguyên được yêu cầu chưa được cập nhật.

```http
HTTP/1.1 200 OK
Content-Type: text/html
Content-Length: 1024
Date: Tue, 22 Feb 2022 22:22:22 GMT
Last-Modified: Tue, 22 Feb 2022 22:00:00 GMT
ETag: "deadbeef"
Cache-Control: no-cache

<!doctype html>
…
```

Thường được phát biểu rằng sự kết hợp của `max-age=0` và `must-revalidate` có cùng ý nghĩa với `no-cache`.

```http
Cache-Control: max-age=0, must-revalidate
```

`max-age=0` có nghĩa là phản hồi ngay lập tức trở nên cũ, và `must-revalidate` có nghĩa là nó không được tái sử dụng mà không xác nhận lại một khi đã cũ — vì vậy, kết hợp lại, ngữ nghĩa dường như giống với `no-cache`.

Tuy nhiên, cách sử dụng `max-age=0` đó là tàn dư của thực tế rằng nhiều triển khai trước HTTP/1.1 không thể xử lý chỉ thị `no-cache` — và vì vậy để giải quyết hạn chế đó, `max-age=0` đã được sử dụng như một biện pháp giải quyết.

Nhưng bây giờ khi các máy chủ tuân thủ HTTP/1.1 được triển khai rộng rãi, không có lý do gì để sử dụng kết hợp `max-age=0` và `must-revalidate` đó — thay vào đó bạn chỉ nên sử dụng `no-cache`.

## Không lưu vào bộ nhớ đệm

Chỉ thị `no-cache` không ngăn chặn việc lưu trữ phản hồi mà thay vào đó ngăn chặn việc tái sử dụng phản hồi mà không xác nhận lại.

Nếu bạn không muốn phản hồi được lưu trữ trong bất kỳ bộ nhớ đệm nào, hãy sử dụng `no-store`.

```http
Cache-Control: no-store
```

Tuy nhiên, nhìn chung, yêu cầu "không lưu vào bộ nhớ đệm" trong thực tế tương ứng với các tình huống sau:

- Không muốn phản hồi được lưu trữ bởi bất kỳ ai khác ngoài client cụ thể, vì lý do quyền riêng tư.
- Muốn luôn cung cấp thông tin cập nhật.
- Không biết điều gì có thể xảy ra trong các triển khai lỗi thời.

Trong những tình huống đó, `no-store` không phải lúc nào cũng là chỉ thị phù hợp nhất.

Các phần sau xem xét các tình huống chi tiết hơn.

### Không chia sẻ với người khác

Sẽ là vấn đề nếu phản hồi có nội dung được cá nhân hóa vô tình hiển thị cho các người dùng khác của bộ nhớ đệm.

Trong trường hợp đó, sử dụng chỉ thị `private` sẽ khiến phản hồi được cá nhân hóa chỉ được lưu trữ với client cụ thể và không bị rò rỉ đến bất kỳ người dùng nào khác của bộ nhớ đệm.

```http
Cache-Control: private
```

Trong trường hợp đó, ngay cả khi `no-store` được cung cấp, `private` cũng phải được cung cấp.

### Cung cấp nội dung cập nhật mỗi lần

Chỉ thị `no-store` ngăn chặn phản hồi được lưu trữ, nhưng không xóa bất kỳ phản hồi nào đã lưu trữ cho cùng URL.

Nói cách khác, nếu có phản hồi cũ đã được lưu trữ cho URL cụ thể, trả về `no-store` sẽ không ngăn chặn phản hồi cũ được tái sử dụng.

Tuy nhiên, chỉ thị `no-cache` sẽ buộc client gửi yêu cầu xác nhận trước khi tái sử dụng bất kỳ phản hồi nào đã lưu trữ.

```http
Cache-Control: no-cache
```

Nếu máy chủ không hỗ trợ các yêu cầu có điều kiện, bạn có thể buộc client truy cập máy chủ mỗi lần và luôn nhận phản hồi mới nhất với `200 OK`.

### Xử lý các triển khai lỗi thời

Là biện pháp giải quyết cho các triển khai lỗi thời bỏ qua `no-store`, bạn có thể thấy các tiêu đề kitchen-sink như sau được sử dụng.

```http
Cache-Control: no-store, no-cache, max-age=0, must-revalidate, proxy-revalidate
```

[Khuyến nghị](https://learn.microsoft.com/en-us/previous-versions/troubleshoot/browsers/connectivity-navigation/how-to-prevent-caching) sử dụng `no-cache` như một giải pháp thay thế để xử lý các triển khai lỗi thời như vậy, và không có vấn đề gì nếu `no-cache` được cung cấp từ đầu, vì máy chủ sẽ luôn nhận được yêu cầu.

Nếu bộ nhớ đệm chia sẻ là mối lo ngại của bạn, bạn có thể đảm bảo ngăn chặn bộ nhớ đệm không mong muốn bằng cách thêm `private`:

```http
Cache-Control: no-cache, private
```

### Những gì bị mất bởi `no-store`

Bạn có thể nghĩ rằng việc thêm `no-store` sẽ là cách đúng để bỏ qua bộ nhớ đệm.

Tuy nhiên, không nên cấp `no-store` một cách tự do, vì bạn mất nhiều ưu điểm mà HTTP và trình duyệt có, bao gồm bộ nhớ đệm back/forward của trình duyệt.

Do đó, để có được những ưu điểm của bộ tính năng đầy đủ của nền tảng web, hãy ưu tiên sử dụng `no-cache` kết hợp với `private`.

## Tải lại và buộc tải lại

Xác nhận có thể được thực hiện cho các yêu cầu cũng như phản hồi.

Các hành động **tải lại** và **buộc tải lại** là các ví dụ phổ biến về xác nhận được thực hiện từ phía trình duyệt.

### Tải lại

Để phục hồi sau khi cửa sổ bị hỏng hoặc cập nhật lên phiên bản mới nhất của tài nguyên, trình duyệt cung cấp chức năng tải lại cho người dùng.

Một cái nhìn đơn giản hóa của yêu cầu HTTP được gửi trong quá trình tải lại trình duyệt trông như sau:

```http
GET / HTTP/1.1
Host: example.com
Cache-Control: max-age=0
If-None-Match: "deadbeef"
If-Modified-Since: Tue, 22 Feb 2022 20:20:20 GMT
```

(Các yêu cầu từ Chrome, Edge, và Firefox trông rất giống như trên; các yêu cầu từ Safari sẽ trông hơi khác.)

Chỉ thị `max-age=0` trong yêu cầu chỉ định "tái sử dụng các phản hồi có tuổi 0 hoặc ít hơn" — vì vậy, thực tế, các phản hồi được lưu trữ trung gian không được tái sử dụng.

Kết quả là, một yêu cầu được xác nhận bởi `If-None-Match` và `If-Modified-Since`.

Hành vi đó cũng được định nghĩa trong tiêu chuẩn [Fetch](https://fetch.spec.whatwg.org/#http-network-or-cache-fetch) và có thể được tái tạo trong JavaScript bằng cách gọi `fetch()` với chế độ bộ nhớ đệm được đặt thành `no-cache` (lưu ý rằng `reload` không phải là chế độ đúng cho trường hợp này):

```js
// Note: "reload" is not the right mode for a normal reload; "no-cache" is
fetch("/", { cache: "no-cache" });
```

### Buộc tải lại

Các trình duyệt sử dụng `max-age=0` trong quá trình tải lại vì lý do tương thích ngược — vì nhiều triển khai lỗi thời trước HTTP/1.1 không hiểu `no-cache`. Nhưng `no-cache` ổn bây giờ trong trường hợp sử dụng này, và **buộc tải lại** là một cách bổ sung để bỏ qua các phản hồi được lưu vào bộ nhớ đệm.

Yêu cầu HTTP trong quá trình **buộc tải lại** trình duyệt trông như sau:

```http
GET / HTTP/1.1
Host: example.com
Pragma: no-cache
Cache-Control: no-cache
```

(Các yêu cầu từ Chrome, Edge, và Firefox trông rất giống như trên; các yêu cầu từ Safari sẽ trông hơi khác.)

Vì đó không phải là yêu cầu có điều kiện với `no-cache`, bạn có thể chắc chắn rằng bạn sẽ nhận được `200 OK` từ máy chủ nguồn.

Hành vi đó cũng được định nghĩa trong tiêu chuẩn [Fetch](https://fetch.spec.whatwg.org/#http-network-or-cache-fetch) và có thể được tái tạo trong JavaScript bằng cách gọi `fetch()` với chế độ bộ nhớ đệm được đặt thành `reload` (lưu ý rằng không phải `force-reload`):

```js
// Note: "reload" — rather than "no-cache" — is the right mode for a "force reload"
fetch("/", { cache: "reload" });
```

### Tránh xác nhận lại

Nội dung không bao giờ thay đổi nên được cung cấp một `max-age` dài bằng cách sử dụng cache busting — tức là bằng cách bao gồm số phiên bản, giá trị băm, v.v. trong URL yêu cầu.

Tuy nhiên, khi người dùng tải lại, yêu cầu xác nhận lại được gửi ngay cả khi máy chủ biết nội dung là bất biến.

Để ngăn điều đó, chỉ thị `immutable` có thể được sử dụng để chỉ rõ ràng rằng xác nhận lại là không cần thiết vì nội dung không bao giờ thay đổi.

```http
Cache-Control: max-age=31536000, immutable
```

Điều đó ngăn chặn xác nhận lại không cần thiết trong quá trình tải lại.

Lưu ý rằng, thay vì triển khai chỉ thị đó, [Chrome đã thay đổi triển khai của mình](https://blog.chromium.org/2017/01/reload-reloaded-faster-and-leaner-page_26.html) để không thực hiện xác nhận lại trong quá trình tải lại cho các tài nguyên con.

## Xóa các phản hồi đã lưu trữ

Không có cách nào để xóa các phản hồi trên máy chủ trung gian đã được lưu trữ với `max-age` dài.

Hãy tưởng tượng rằng phản hồi sau từ `https://example.com/` đã được lưu trữ.

```http
HTTP/1.1 200 OK
Content-Type: text/html
Content-Length: 1024
Cache-Control: max-age=31536000

<!doctype html>
…
```

Bạn có thể muốn ghi đè phản hồi đó sau khi nó hết hạn trên máy chủ, nhưng không có gì máy chủ có thể làm sau khi phản hồi được lưu trữ — vì không có thêm yêu cầu nào đến máy chủ do bộ nhớ đệm.

Một trong các phương pháp được đề cập trong thông số kỹ thuật là gửi yêu cầu cho cùng URL với phương thức không an toàn như `POST`, nhưng điều đó khó thực hiện cho nhiều client.

Tiêu đề và giá trị chỉ thị [`Clear-Site-Data: cache`](/en-US/docs/Web/HTTP/Reference/Headers/Clear-Site-Data#cache) có thể được sử dụng để xóa bộ nhớ đệm trình duyệt — nhưng không có hiệu lực đối với bộ nhớ đệm trung gian.
Ngược lại, các phản hồi sẽ vẫn ở trong bộ nhớ đệm trình duyệt cho đến khi `max-age` hết hạn, trừ khi người dùng thực hiện thủ công hành động tải lại, buộc tải lại, hoặc xóa lịch sử.

Bộ nhớ đệm giảm truy cập đến máy chủ, điều đó có nghĩa là máy chủ mất quyền kiểm soát URL đó. Nếu máy chủ không muốn mất quyền kiểm soát URL — ví dụ, trong trường hợp tài nguyên được cập nhật thường xuyên — bạn nên thêm `no-cache` để máy chủ sẽ luôn nhận được yêu cầu và gửi phản hồi đã định.

## Thu gọn yêu cầu

Bộ nhớ đệm chia sẻ chủ yếu nằm trước máy chủ nguồn và nhằm mục đích giảm lưu lượng đến máy chủ nguồn.

Như vậy, nếu nhiều yêu cầu giống hệt nhau đến bộ nhớ đệm chia sẻ cùng một lúc, bộ nhớ đệm trung gian sẽ chuyển tiếp một yêu cầu duy nhất thay mặt cho chính nó đến máy chủ nguồn, sau đó có thể tái sử dụng kết quả cho tất cả client. Điều này được gọi là _**thu gọn yêu cầu**_.

Thu gọn yêu cầu xảy ra khi các yêu cầu đến cùng lúc, vì vậy ngay cả khi `max-age=0` hoặc `no-cache` được cung cấp trong phản hồi, nó sẽ được tái sử dụng.

Nếu phản hồi được cá nhân hóa cho một người dùng cụ thể và bạn không muốn nó được chia sẻ trong thu gọn, bạn nên thêm chỉ thị `private`:

![Thu gọn yêu cầu được hiển thị như nhiều client gửi yêu cầu GET và bộ nhớ đệm hợp nhất chúng thành một GET đến nguồn gốc. Máy chủ nguồn phản hồi với 200 OK mà bộ nhớ đệm chia sẻ lại cho tất cả client.](https://mdn.github.io/shared-assets/images/diagrams/http/cache/request-collapse.svg)

## Các mẫu bộ nhớ đệm phổ biến

Có nhiều chỉ thị trong thông số kỹ thuật `Cache-Control`, và có thể khó hiểu tất cả chúng. Nhưng hầu hết các trang web có thể được bao phủ bởi sự kết hợp của một vài mẫu.

Phần này mô tả các mẫu phổ biến trong thiết kế bộ nhớ đệm.

### Cài đặt mặc định

Như đề cập ở trên, hành vi mặc định cho bộ nhớ đệm (tức là cho phản hồi không có `Cache-Control`) không đơn giản là "không lưu vào bộ nhớ đệm" mà là bộ nhớ đệm ngầm theo "bộ nhớ đệm theo phỏng đoán".

Để tránh bộ nhớ đệm theo phỏng đoán đó, tốt hơn là cung cấp rõ ràng cho tất cả phản hồi một tiêu đề `Cache-Control` mặc định.

Để đảm bảo rằng theo mặc định các phiên bản mới nhất của tài nguyên sẽ luôn được truyền, thực tế phổ biến là làm cho giá trị `Cache-Control` mặc định bao gồm `no-cache`:

```http
Cache-Control: no-cache
```

Ngoài ra, nếu dịch vụ triển khai cookie hoặc các phương thức đăng nhập khác, và nội dung được cá nhân hóa cho mỗi người dùng, thì `private` cũng phải được cung cấp để ngăn chặn chia sẻ với người dùng khác:

```http
Cache-Control: no-cache, private
```

### Cache Busting

Các tài nguyên hoạt động tốt nhất với bộ nhớ đệm là các tệp tĩnh bất biến có nội dung không bao giờ thay đổi. Và đối với các tài nguyên _thay đổi_, thực hành tốt nhất phổ biến là thay đổi URL mỗi khi nội dung thay đổi, để đơn vị URL có thể được lưu vào bộ nhớ đệm trong thời gian dài hơn.

Ví dụ, hãy xem xét HTML sau:

```html
<script src="bundle.js"></script>
<link rel="stylesheet" href="build.css" />
<body>
  hello
</body>
```

Trong phát triển web hiện đại, các tài nguyên JavaScript và CSS thường xuyên được cập nhật khi quá trình phát triển tiến hành. Ngoài ra, nếu các phiên bản của tài nguyên JavaScript và CSS mà client sử dụng không đồng bộ, hiển thị sẽ bị hỏng.

Vì vậy HTML trên làm cho việc lưu vào bộ nhớ đệm `bundle.js` và `build.css` với `max-age` trở nên khó khăn.

Do đó, bạn có thể phục vụ JavaScript và CSS với URL bao gồm phần thay đổi dựa trên số phiên bản hoặc giá trị băm. Một số cách để làm điều đó được hiển thị bên dưới.

```plain
# version in filename
bundle.v123.js

# version in query
bundle.js?v=123

# hash in filename
bundle.YsAIAAAA-QG4G6kCMAMBAAAAAAAoK.js

# hash in query
bundle.js?v=YsAIAAAA-QG4G6kCMAMBAAAAAAAoK
```

Vì bộ nhớ đệm phân biệt các tài nguyên với nhau dựa trên URL của chúng, bộ nhớ đệm sẽ không được tái sử dụng nếu URL thay đổi khi tài nguyên được cập nhật.

```html
<script src="bundle.v123.js"></script>
<link rel="stylesheet" href="build.v123.css" />
<body>
  hello
</body>
```

Với thiết kế đó, cả tài nguyên JavaScript và CSS đều có thể được lưu vào bộ nhớ đệm trong thời gian dài. Vậy `max-age` nên được đặt bao lâu? Thông số kỹ thuật QPACK cung cấp câu trả lời cho câu hỏi đó.

[QPACK](https://datatracker.ietf.org/doc/html/rfc9204) là tiêu chuẩn để nén các trường tiêu đề HTTP, với các bảng giá trị trường thường được sử dụng được định nghĩa.

Một số giá trị tiêu đề bộ nhớ đệm thường được sử dụng được hiển thị bên dưới.

```plain
36 cache-control max-age=0
37 cache-control max-age=604800
38 cache-control max-age=2592000
39 cache-control no-cache
40 cache-control no-store
41 cache-control public, max-age=31536000
```

Nếu bạn chọn một trong những tùy chọn được đánh số đó, bạn có thể nén các giá trị trong 1 byte khi được truyền qua HTTP3.

Các số `37`, `38`, và `41` là cho các khoảng thời gian một tuần, một tháng, và một năm.

Vì bộ nhớ đệm xóa các mục cũ khi các mục mới được lưu, xác suất rằng một phản hồi đã lưu trữ vẫn tồn tại sau một tuần không cao — ngay cả khi `max-age` được đặt thành 1 tuần. Do đó, trong thực tế, không tạo ra nhiều sự khác biệt khi bạn chọn cái nào.

Lưu ý rằng số `41` có `max-age` dài nhất (1 năm), nhưng với `public`.

Giá trị `public` có tác dụng làm cho phản hồi có thể lưu trữ ngay cả khi tiêu đề `Authorization` có mặt.

> [!NOTE]
> Chỉ thị `public` chỉ nên được sử dụng nếu cần lưu trữ phản hồi khi tiêu đề `Authorization` được đặt.
> Nó không bắt buộc trong trường hợp khác, vì phản hồi sẽ được lưu trữ trong bộ nhớ đệm chia sẻ miễn là `max-age` được cung cấp.

Vì vậy nếu phản hồi được cá nhân hóa bằng xác thực cơ bản, sự hiện diện của `public` có thể gây ra vấn đề. Nếu bạn lo lắng về điều đó, bạn có thể chọn giá trị dài thứ hai, `38` (1 tháng).

```http
# response for bundle.v123.js

# If you never personalize responses via Authorization
Cache-Control: public, max-age=31536000

# If you can't be certain
Cache-Control: max-age=2592000
```

### Xác nhận

Đừng quên đặt các tiêu đề `Last-Modified` và `ETag`, để bạn không phải truyền lại tài nguyên khi tải lại. Dễ dàng tạo các tiêu đề đó cho các tệp tĩnh được xây dựng sẵn.

Giá trị `ETag` ở đây có thể là băm của tệp.

```http
# response for bundle.v123.js
Last-Modified: Tue, 22 Feb 2022 20:20:20 GMT
ETag: "YsAIAAAA-QG4G6kCMAMBAAAAAAAoK"
```

Ngoài ra, `immutable` có thể được thêm vào để ngăn xác nhận khi tải lại.

Kết quả kết hợp được hiển thị bên dưới.

```http
# bundle.v123.js
HTTP/1.1 200 OK
Content-Type: text/javascript
Content-Length: 1024
Cache-Control: public, max-age=31536000, immutable
Last-Modified: Tue, 22 Feb 2022 20:20:20 GMT
ETag: "YsAIAAAA-QG4G6kCMAMBAAAAAAAoK"
```

**Cache busting** là kỹ thuật làm cho phản hồi có thể lưu vào bộ nhớ đệm trong thời gian dài bằng cách thay đổi URL khi nội dung thay đổi. Kỹ thuật này có thể được áp dụng cho tất cả các tài nguyên con, chẳng hạn như hình ảnh.

> [!NOTE]
> Khi đánh giá việc sử dụng `immutable` và QPACK:
> Nếu bạn lo lắng rằng `immutable` thay đổi giá trị được xác định trước do QPACK cung cấp, hãy xem xét rằng
> trong trường hợp này, phần `immutable` có thể được mã hóa riêng bằng cách chia giá trị `Cache-Control` thành hai dòng — mặc dù điều này phụ thuộc vào thuật toán mã hóa mà một triển khai QPACK cụ thể sử dụng.

```http
Cache-Control: public, max-age=31536000
Cache-Control: immutable
```

### Tài nguyên chính

Không giống như các tài nguyên con, các tài nguyên chính không thể cache bust vì URL của chúng không thể được trang trí theo cùng cách mà URL tài nguyên con có thể.

Nếu chính HTML sau được lưu trữ, phiên bản mới nhất không thể hiển thị ngay cả khi nội dung được cập nhật phía máy chủ.

```html
<script src="bundle.v123.js"></script>
<link rel="stylesheet" href="build.v123.css" />
<body>
  hello
</body>
```

Đối với trường hợp đó, `no-cache` sẽ phù hợp — thay vì `no-store` — vì chúng ta không muốn lưu HTML, mà thay vào đó chỉ muốn nó luôn cập nhật.

Hơn nữa, việc thêm `Last-Modified` và `ETag` sẽ cho phép client gửi các yêu cầu có điều kiện, và `304 Not Modified` có thể được trả về nếu không có cập nhật nào đối với HTML:

```http
HTTP/1.1 200 OK
Content-Type: text/html
Content-Length: 1024
Cache-Control: no-cache
Last-Modified: Tue, 22 Feb 2022 20:20:20 GMT
ETag: "AAPuIbAOdvAGEETbgAAAAAAABAAE"
```

Cài đặt đó phù hợp cho HTML không được cá nhân hóa, nhưng đối với phản hồi được cá nhân hóa bằng cookie — ví dụ, sau khi đăng nhập — đừng quên cũng chỉ định `private`:

```http
HTTP/1.1 200 OK
Content-Type: text/html
Content-Length: 1024
Cache-Control: no-cache, private
Last-Modified: Tue, 22 Feb 2022 20:20:20 GMT
ETag: "AAPuIbAOdvAGEETbgAAAAAAABAAE"
Set-Cookie: __Host-SID=AHNtAyt3fvJrUL5g5tnGwER; Secure; Path=/; HttpOnly
```

Tương tự có thể được sử dụng cho `favicon.ico`, `manifest.json`, `.well-known`, và các điểm cuối API có URL không thể thay đổi bằng cache busting.

Hầu hết nội dung web có thể được bao phủ bởi sự kết hợp của hai mẫu được mô tả ở trên.

### Thêm về bộ nhớ đệm được quản lý

Với phương pháp được mô tả trong các phần trước, các tài nguyên con có thể được lưu vào bộ nhớ đệm trong thời gian dài bằng cách sử dụng cache busting, nhưng các tài nguyên chính (thường là tài liệu HTML) không thể.

Lưu vào bộ nhớ đệm các tài nguyên chính là khó khăn vì, chỉ sử dụng các chỉ thị chuẩn từ thông số kỹ thuật HTTP Caching, không có cách nào để chủ động xóa nội dung bộ nhớ đệm khi nội dung được cập nhật trên máy chủ.

Tuy nhiên, có thể bằng cách triển khai bộ nhớ đệm được quản lý như CDN hoặc service worker.

Ví dụ, một CDN cho phép xóa bộ nhớ đệm thông qua API hoặc thao tác bảng điều khiển sẽ cho phép chiến lược bộ nhớ đệm tích cực hơn bằng cách lưu trữ tài nguyên chính và chỉ xóa bộ nhớ đệm liên quan một cách rõ ràng khi cập nhật xảy ra trên máy chủ.

Service worker có thể làm điều tương tự nếu nó có thể xóa nội dung trong Cache API khi cập nhật xảy ra trên máy chủ.

Để biết thêm thông tin, hãy xem tài liệu cho CDN của bạn, và tham khảo [tài liệu service worker](/en-US/docs/Web/API/Service_Worker_API).

## Xem thêm

- [RFC 9111: Hypertext Transfer Protocol (HTTP/1.1): Caching](https://datatracker.ietf.org/doc/html/RFC9111)
- [Hướng dẫn bộ nhớ đệm - Mark Nottingham](https://www.mnot.net/cache_docs/)
