---
title: Tích hợp nhà cung cấp danh tính với FedCM
slug: Web/API/FedCM_API/IDP_integration
page-type: guide
---

{{DefaultAPISidebar("FedCM API")}}

Bài viết này chi tiết tất cả các bước mà {{glossary("Identity provider", "nhà cung cấp danh tính")}} (IdP) cần thực hiện để tích hợp với Federated Credential Management (FedCM) API.

## Các bước tích hợp IdP

Để tích hợp với FedCM, một IdP cần thực hiện các bước sau:

1. [Cung cấp tệp well-known](#provide_a_well-known_file) để nhận diện IdP.
2. [Cung cấp tệp cấu hình và các điểm cuối](#provide_a_config_file_and_endpoints) cho danh sách tài khoản và cấp phát xác nhận (và tùy chọn là metadata client).
3. [Cập nhật trạng thái đăng nhập](#update_login_status_using_the_login_status_api) bằng Login Status API.

## Cung cấp tệp well-known

Có một vấn đề riêng tư tiềm ẩn khi [IdP có thể biết được liệu người dùng đã truy cập bên dựa vào (RP) hay chưa mà không có sự đồng ý rõ ràng](https://github.com/w3c-fedid/FedCM/issues/230). Điều này có ý nghĩa theo dõi, nên IdP được yêu cầu cung cấp một tệp well-known để xác minh danh tính và giảm thiểu vấn đề này.

Tệp well-known được yêu cầu thông qua yêu cầu [`GET`](/vi/docs/Web/HTTP/Reference/Methods/GET) không có thông tin xác thực, không theo chuyển hướng. Điều này ngăn chặn hiệu quả việc IdP biết ai đã gửi yêu cầu và {{glossary("Relying party", "RP")} nào đang cố gắng kết nối.

Tệp well-known phải được phục vụ từ {{glossary("registrable domain")} của IdP tại `/.well-known/web-identity`. Ví dụ: nếu các điểm cuối IdP được phục vụ dưới `https://accounts.idp.example/`, họ phải phục vụ tệp well-known tại `https://idp.example/.well-known/web-identity`. Nội dung tệp well-known phải có cấu trúc JSON như sau:

```json
{
  "provider_urls": ["https://accounts.idp.example/config.json"]
}
```

Thành viên `provider_urls` phải chứa một mảng các URL trỏ đến các tệp cấu hình IdP hợp lệ mà RP có thể sử dụng để tương tác với IdP. Độ dài mảng hiện được giới hạn ở một.

## Tiêu đề HTTP `Sec-Fetch-Dest`

Tất cả yêu cầu gửi từ trình duyệt thông qua FedCM đều bao gồm tiêu đề `{{httpheader("Sec-Fetch-Dest")}}: webidentity`. Tất cả các điểm cuối IdP nhận yêu cầu có thông tin xác thực (tức là `accounts_endpoint` và `id_assertion_endpoint`) phải xác nhận tiêu đề này được bao gồm để bảo vệ chống lại các cuộc tấn công {{glossary("CSRF")}}.

## Cung cấp tệp cấu hình và các điểm cuối

Tệp cấu hình IdP cung cấp danh sách các điểm cuối mà trình duyệt cần để xử lý luồng liên danh tính và quản lý đăng nhập. Các điểm cuối cần cùng nguồn gốc với cấu hình.

Trình duyệt gửi yêu cầu không có thông tin xác thực cho tệp cấu hình thông qua phương thức [`GET`](/vi/docs/Web/HTTP/Reference/Methods/GET), không theo chuyển hướng. Điều này ngăn chặn hiệu quả việc IdP biết ai đã gửi yêu cầu và RP nào đang cố gắng kết nối.

Tệp cấu hình (được lưu trữ tại `https://accounts.idp.example/config.json` trong ví dụ của chúng ta) phải có cấu trúc JSON như sau:

```json
{
  "accounts_endpoint": "/accounts.php",
  "account_label": "developer",
  "supports_use_other_account": true,
  "client_metadata_endpoint": "/client_metadata.php",
  "disconnect_endpoint": "/disconnect.php",
  "id_assertion_endpoint": "/assertion.php",
  "login_url": "/login",
  "branding": {
    "background_color": "green",
    "color": "0xFFEEAA",
    "icons": [
      {
        "url": "https://idp.example/icon.ico",
        "size": 25
      }
    ]
  }
}
```

Các thuộc tính như sau:

- `accounts_endpoint`
  - : URL cho điểm cuối danh sách tài khoản, trả về danh sách tài khoản mà người dùng hiện đã đăng nhập trên IdP. Trình duyệt sử dụng thông tin này để tạo danh sách các lựa chọn đăng nhập hiển thị cho người dùng trong UI FedCM do trình duyệt cung cấp.
- `account_label` {{optional_inline}}
  - : Một chuỗi, nếu được bao gồm, sẽ chỉ định định danh cho một tập hợp con tài khoản cần trả về khi IdP này được sử dụng để xác thực liên danh. Khi yêu cầu `get()` được thực hiện, chỉ các tài khoản khớp với chuỗi này trong tham số `label_hints` của chúng sẽ được trả về từ [điểm cuối tài khoản](#the_accounts_list_endpoint).
- `supports_use_other_account` {{optional_inline}}
  - : Một boolean mặc định là `false`; nếu đặt thành `true`, nghĩa là người dùng có thể đăng nhập bằng tài khoản khác với tài khoản họ hiện đang đăng nhập (nếu IdP hỗ trợ nhiều tài khoản). Điều này chỉ áp dụng cho các lệnh gọi `get()` chỉ định [chế độ hoạt động](/vi/docs/Web/API/IdentityCredentialRequestOptions#active).
    > [!NOTE]
    > Trong UI đăng nhập của trình duyệt, điều này có thể hiển thị dưới dạng nút "Chọn tài khoản khác".
- `client_metadata_endpoint` {{optional_inline}}
  - : URL cho điểm cuối metadata client, cung cấp các URL trỏ đến trang metadata và điều khoản dịch vụ của RP, để sử dụng trong UI FedCM.
- `disconnect_endpoint` {{optional_inline}}
  - : URL cho điểm cuối ngắt kết nối, được RP sử dụng để ngắt kết nối khỏi IdP, thông qua phương thức {{domxref("IdentityCredential.disconnect_static", "IdentityCredential.disconnect()")}}.
- `id_assertion_endpoint`
  - : URL cho điểm cuối xác nhận ID, khi nhận thông tin xác thực người dùng hợp lệ sẽ phản hồi bằng mã thông báo xác thực mà RP có thể sử dụng để xác thực xác thực.
- `login_url`
  - : URL trang đăng nhập để người dùng đăng nhập vào IdP.
- `branding` {{optional_inline}}
  - : Chứa thông tin thương hiệu sẽ được sử dụng trong UI FedCM do trình duyệt cung cấp để tùy chỉnh giao diện theo mong muốn của IdP. Kích thước biểu tượng được cung cấp phải lớn hơn hoặc bằng `25` (`25px`) ở chế độ thụ động và lớn hơn hoặc bằng `40` (`40px`) ở chế độ hoạt động (xem [Chế độ hoạt động so với thụ động](/vi/docs/Web/API/FedCM_API/RP_sign-in#active_versus_passive_mode) để biết thêm chi tiết).

Bảng sau tóm tắt các yêu cầu khác nhau được thực hiện bởi FedCM API:

| Endpoint/tài nguyên        | Method | Có thông tin xác thực (với cookie) | Bao gồm {{httpheader("Origin")}} |
| -------------------------- | ------ | --------------------------------- | -------------------------------- |
| `well-known`/`config.json` | `GET`  | Không                             | Không                            |
| `accounts_endpoint`        | `GET`  | Có                                | Không                            |
| `client_metadata_endpoint` | `GET`  | Không                             | Có                               |
| `disconnect_endpoint`      | `POST` | Có                                | Có                               |
| `id_assertion_endpoint`    | `POST` | Có                                | Có                               |

> [!NOTE]
> Để biết mô tả luồng FedCM trong đó các điểm cuối này được truy cập, xem [Luồng đăng nhập FedCM](/vi/docs/Web/API/FedCM_API/RP_sign-in#fedcm_sign-in_flow).

> [!NOTE]
> Không có yêu cầu nào FedCM API gửi đến các điểm cuối được mô tả ở đây cho phép theo chuyển hướng, vì lý do riêng tư.

### Điểm cuối danh sách tài khoản

Trình duyệt gửi yêu cầu đến điểm cuối này bằng phương thức `GET`. Yêu cầu không có tham số `client_id`, tiêu đề {{httpheader("Origin")}} hoặc tiêu đề {{httpheader("Referer")}}. Điều này ngăn chặn hiệu quả việc IdP biết RP nào người dùng đang cố gắng đăng nhập.

Ví dụ:

```http
GET /accounts.php HTTP/1.1
Host: idp.example
Accept: application/json
Cookie: 0x23223
Sec-Fetch-Dest: webidentity
```

Yêu cầu này có thông tin xác thực: nghĩa là, nó bao gồm cookie cho trang web của IdP, mà IdP có thể sử dụng để xác định tài khoản IdP nào người dùng đã đăng nhập.

Lưu ý rằng vì yêu cầu của trình duyệt đến điểm cuối này là yêu cầu chéo trang web, cookie sẽ chỉ được bao gồm nếu chúng có giá trị thuộc tính [`SameSite`](/vi/docs/Web/HTTP/Reference/Headers/Set-Cookie#samesitesamesite-value) là `None`. Điều này có nghĩa là IdP không thể sử dụng `SameSite` như một phần của biện pháp phòng thủ chống lại [Cross-Site Request Forgery (CSRF)](/vi/docs/Web/Security/Attacks/CSRF), nên họ phải triển khai các biện pháp phòng thủ thay thế.

Phản hồi trả về danh sách tất cả tài khoản IdP mà người dùng hiện đã đăng nhập (không cụ thể cho bất kỳ RP nào), với cấu trúc JSON như sau:

```json
{
  "accounts": [
    {
      "id": "elaina_maduro",
      "given_name": "Elaina",
      "name": "Elaina Maduro",
      "email": "elaina_maduro@idp.example",
      "tel": "+491234567890",
      "username": "elaina420",
      "picture": "https://idp.example/profile/123",
      "approved_clients": ["123", "456", "789"],
      "domain_hints": ["rp1.example.com", "rp3.example.com"],
      "label_hints": ["developer", "admin"],
      "login_hints": ["elaina_maduro", "elaina_maduro@idp.example"]
    },
    {
      "id": "elly",
      "given_name": "Elly",
      "username": "elly123",
      "email": "Elly@idp.example",
      "picture": "https://idp.example/profile/456",
      "approved_clients": ["abc", "def", "ghi"],
      "domain_hints": ["rp1.example.com", "rp2.example.com"],
      "label_hints": ["developer", "test"],
      "login_hints": ["elly", "elly@idp.example"]
    }
  ]
}
```

Điều này bao gồm các thông tin sau, trong đó `name`, `email`, `username` và `tel` là tùy chọn nhưng ít nhất một trong số chúng phải có và không rỗng.

- `id`
  - : ID duy nhất của người dùng.
- `name` {{optional_inline}}
  - : Họ của người dùng.
- `email` {{optional_inline}}
  - : Địa chỉ email của người dùng.
- `tel` {{optional_inline}}
  - : Số điện thoại của người dùng. Có thể ở bất kỳ định dạng nào.
- `username` {{optional_inline}}
  - : Tên người dùng của người dùng.
- `given_name` {{optional_inline}}
  - : Tên của người dùng.
- `picture` {{optional_inline}}
  - : URL hình ảnh đại diện của người dùng.
- `approved_clients` {{optional_inline}}
  - : Một mảng các client RP mà người dùng đã đăng ký.
- `domain_hints` {{optional_inline}}
  - : Một mảng các tên miền mà tài khoản được liên kết. RP có thể thực hiện lệnh gọi `get()` bao gồm thuộc tính [`domainHint`](/vi/docs/Web/API/IdentityCredentialRequestOptions#domainhint) để lọc tài khoản trả về theo tên miền.
- `label_hints` {{optional_inline}}
  - : Một mảng các chuỗi chỉ định nhãn xác định loại tài khoản mà tài khoản được xác định. Nếu tệp cấu hình chỉ định [`account_label`](#account_label), chỉ các tài khoản chứa nhãn đó trong `label_hints` sẽ được trả về từ điểm cuối danh sách tài khoản.
- `login_hints` {{optional_inline}}
  - : Một mảng các chuỗi đại diện cho tài khoản. Các chuỗi này được sử dụng để lọc danh sách tùy chọn tài khoản mà trình duyệt cung cấp cho người dùng đăng nhập. Điều này xảy ra khi thuộc tính `loginHint` được cung cấp trong [`identity.providers`](/vi/docs/Web/API/IdentityCredentialRequestOptions#providers) trong lệnh gọi `get()` liên quan. Bất kỳ tài khoản nào có chuỗi trong mảng `login_hints` khớp với `loginHint` được cung cấp sẽ được bao gồm.

> [!NOTE]
> Nếu người dùng chưa đăng nhập vào bất kỳ tài khoản IdP nào, điểm cuối sẽ phản hồi với [HTTP 401 (Unauthorized)](/vi/docs/Web/HTTP/Reference/Status/401).

### Điểm cuối metadata client

Trình duyệt gửi yêu cầu không có thông tin xác thực đến điểm cuối này thông qua phương thức `GET`, với `clientId` được truyền vào lệnh gọi `get()` làm tham số.

Ví dụ:

```http
GET /client_metadata.php?client_id=1234 HTTP/1.1
Host: idp.example
Origin: https://rp.example/
Accept: application/json
Sec-Fetch-Dest: webidentity
```

Phản hồi cho một yêu cầu thành công bao gồm các URL trỏ đến trang metadata và điều khoản dịch vụ của RP, để sử dụng trong UI FedCM do trình duyệt cung cấp. Phản hồi này phải tuân theo cấu trúc JSON như dưới đây:

```json
{
  "privacy_policy_url": "https://rp.example/privacy_policy.html",
  "terms_of_service_url": "https://rp.example/terms_of_service.html"
}
```

### Điểm cuối ngắt kết nối

Bằng cách gọi {{domxref("IdentityCredential.disconnect_static", "IdentityCredential.disconnect()")}}, trình duyệt gửi yêu cầu {{httpmethod("POST")}} chéo nguồn gốc với cookie và {{httpheader("Content-Type")}} là `application/x-www-form-urlencoded` đến điểm cuối ngắt kết nối với các thông tin sau:

- `account_hint`
  - : Một chuỗi chỉ định gợi ý tài khoản mà IdP sử dụng để xác định tài khoản cần ngắt kết nối.
- `client_id`
  - : Một chuỗi chỉ định định danh client của RP.

Ví dụ:

```http
POST /disconnect HTTP/1.1
Host: idp.example
Origin: rp.example
Content-Type: application/x-www-form-urlencoded
Cookie: 0x123
Sec-Fetch-Dest: webidentity

account_hint=account456&client_id=rp123
```

Sau khi nhận yêu cầu, máy chủ IdP sẽ:

1. Phản hồi yêu cầu với [CORS (Cross-Origin Resource Sharing)](/vi/docs/Web/HTTP/Guides/CORS).
2. Xác minh rằng yêu cầu chứa tiêu đề HTTP {{httpheader("Sec-Fetch-Dest")}} với chỉ thị `webidentity`.
3. Đối chiếu tiêu đề {{httpheader("Origin")}} với nguồn gốc RP được xác định bởi `client_id`. Từ chối promise nếu chúng không khớp.
4. Tìm tài khoản khớp với `account_hint`.
5. Ngắt kết nối tài khoản người dùng khỏi danh sách tài khoản đã kết nối của RP.
6. Phản hồi với `account_id` của người dùng được xác định ở định dạng JSON:

   ```json
   {
     "account_id": "account456"
   }
   ```

> [!NOTE]
> Nếu IdP muốn ngắt kết nối tất cả tài khoản liên kết với RP, họ có thể truyền một chuỗi không khớp với bất kỳ `account_id` nào, ví dụ `"account_id": "*"`.

### Điểm cuối xác nhận ID

Trình duyệt gửi yêu cầu có thông tin xác thực đến điểm cuối này thông qua phương thức [`POST`](/vi/docs/Web/HTTP/Reference/Methods/POST), với loại nội dung là `application/x-www-form-urlencoded`. Yêu cầu cũng bao gồm payload chứa chi tiết về lần đăng nhập đang thử và tài khoản cần xác thực.

Nó sẽ trông giống như sau:

```http
POST /assertion.php HTTP/1.1
Host: idp.example
Origin: https://rp.example/
Content-Type: application/x-www-form-urlencoded
Cookie: 0x23223
Sec-Fetch-Dest: webidentity
account_id=123&client_id=client1234&disclosure_text_shown=true&is_auto_selected=true
```

Yêu cầu đến điểm cuối này được gửi do người dùng chọn một tài khoản để đăng nhập từ UI trình duyệt liên quan. Khi nhận thông tin xác thực người dùng hợp lệ, điểm cuối này sẽ phản hồi bằng mã thông báo xác thực mà RP có thể sử dụng để xác thực người dùng trên máy chủ của riêng họ, theo hướng dẫn sử dụng do IdP mà họ đang sử dụng để liên danh tính đưa ra. Sau khi RP xác thực người dùng, họ có thể đăng nhập người dùng, đăng ký dịch vụ của họ, v.v.

```json
{
  "token": "***********"
}
```

Payload yêu cầu chứa các tham số sau:

- `client_id`
  - : Định danh client của RP (khớp với `clientId` từ yêu cầu `get()` ban đầu).
- `account_id`
  - : ID duy nhất của tài khoản người dùng cần đăng nhập (khớp với `id` của người dùng từ phản hồi điểm cuối danh sách tài khoản).
- `params` {{optional_inline}}
  - : Tuần tự hóa đối tượng `params` từ yêu cầu `get()` ban đầu.
- `disclosure_text_shown`
  - : Một chuỗi `"true"` hoặc `"false"` cho biết văn bản tiết lộ đã được hiển thị hay chưa. Văn bản tiết lộ là thông tin hiển thị cho người dùng (có thể bao gồm các liên kết điều khoản dịch vụ và chính sách riêng tư, nếu được cung cấp) nếu người dùng đã đăng nhập vào IdP nhưng không có tài khoản cụ thể trên RP hiện tại (trong trường hợp này họ cần chọn "Tiếp tục với..." danh tính IdP của họ và sau đó tạo tài khoản tương ứng trên RP).
- `is_auto_selected`
  - : Một chuỗi `"true"` hoặc `"false"` cho biết yêu cầu xác thực xác thực có được phát hành do [tự động xác thực lại](/vi/docs/Web/API/FedCM_API/RP_sign-in#auto-reauthentication), tức là không có sự tham gia của người dùng hay không. Điều này có thể xảy ra khi lệnh gọi {{domxref("CredentialsContainer.get", "get()")}} được phát hành với giá trị tùy chọn [`mediation`](/vi/docs/Web/API/CredentialsContainer/get#mediation) là `"optional"` hoặc `"silent"`. IdP cần biết liệu tự động xác thực lại đã xảy ra hay chưa để đánh giá hiệu suất và trong trường hợp muốn bảo mật cao hơn. Ví dụ, IdP có thể trả về mã lỗi cho RP biết rằng họ yêu cầu sự tham gia rõ ràng của người dùng (`mediation="required"`).

> [!NOTE]
> Nếu lệnh gọi {{domxref("CredentialsContainer.get", "get()")}} thành công, giá trị `is_auto_selected` cũng được truyền đến RP thông qua thuộc tính {{domxref("IdentityCredential.isAutoSelected")}}.

#### Tiêu đề CORS cho điểm cuối xác nhận ID

Phản hồi điểm cuối xác nhận ID phải bao gồm các tiêu đề {{httpheader("Access-Control-Allow-Origin")}} và {{httpheader("Access-Control-Allow-Credentials")}}, và `Access-Control-Allow-Origin` phải bao gồm nguồn gốc của người yêu cầu:

```http
Access-Control-Allow-Origin: https://rp.example
Access-Control-Allow-Credentials: true
```

Lưu ý rằng `Access-Control-Allow-Origin` phải được đặt thành nguồn gốc cụ thể của người yêu cầu (RP) và không thể là giá trị ký tự đại diện `*`.

Nếu không có các tiêu đề này, yêu cầu sẽ thất bại với lỗi mạng.

#### Phản hồi lỗi xác nhận ID

Nếu IdP không thể cấp mã thông báo — ví dụ: nếu client không được ủy quyền — điểm cuối xác nhận ID sẽ phản hồi bằng phản hồi lỗi chứa thông tin về bản chất của lỗi. Ví dụ:

```json
{
  "error": {
    "code": "access_denied",
    "url": "https://idp.example/error?type=access_denied"
  }
}
```

Các trường phản hồi lỗi như sau:

- `code` {{optional_inline}}
  - : Một chuỗi. Đây có thể là lỗi đã biết từ [danh sách lỗi được chỉ định OAuth 2.0](https://datatracker.ietf.org/doc/html/rfc6749#section-4.1.2.1) hoặc một chuỗi tùy ý.
- `url` {{optional_inline}}
  - : Một URL. Đây phải là trang web chứa thông tin dễ đọc về lỗi để hiển thị cho người dùng, chẳng hạn như cách khắc phục lỗi hoặc liên hệ bộ phận dịch vụ khách hàng. URL phải cùng trang web với URL cấu hình của IdP.

Thông tin này có thể được sử dụng theo một số cách khác nhau:

- Trình duyệt có thể hiển thị UI tùy chỉnh cho người dùng thông báo về sự cố (xem [tài liệu Chrome](https://privacysandbox.google.com/blog/fedcm-chrome-120-updates#error-api) để biết ví dụ). Hãy lưu ý rằng nếu yêu cầu thất bại vì máy chủ IdP không khả dụng, rõ ràng nó không thể trả về bất kỳ thông tin nào. Trong những trường hợp như vậy, trình duyệt sẽ báo cáo điều này thông qua thông báo chung.
- Lệnh gọi {{domxref("CredentialsContainer.get", "navigator.credentials.get()")}} của RP liên kết được sử dụng để thử đăng nhập sẽ từ chối promise của nó với {{domxref("IdentityCredentialError")}}, chứa thông tin lỗi. RP có thể bắt lỗi này và sau đó theo dõi UI tùy chỉnh của trình duyệt bằng một số thông tin để giúp người dùng thành công trong lần đăng nhập tiếp theo.

## Cập nhật trạng thái đăng nhập bằng Login Status API

**Login Status API** cho phép IdP thông báo cho trình duyệt về trạng thái đăng nhập của họ trong trình duyệt cụ thể đó — ý chúng ta là "liệu có người dùng nào đăng nhập vào IdP trên trình duyệt hiện tại hay không". Trình duyệt lưu trữ trạng thái này cho mỗi IdP; sau đó FedCM API sử dụng nó để giảm số lượng yêu cầu gửi đến IdP (vì không cần lãng phí thời gian yêu cầu tài khoản khi không có người dùng nào đăng nhập vào IdP). Nó cũng giảm thiểu [các cuộc tấn công thời gian tiềm ẩn](https://github.com/w3c-fedid/FedCM/issues/447).

Cho mỗi IdP đã biết (được xác định bằng URL cấu hình của nó), trình duyệt giữ một biến ba trạng thái đại diện cho trạng thái đăng nhập với ba giá trị có thể:

- `"logged-in"`: IdP có ít nhất một tài khoản người dùng đăng nhập. Lưu ý rằng, ở giai đoạn này, RP và trình duyệt không biết người dùng đó là ai. Thông tin về người dùng cụ thể được trả về từ [`accounts_endpoint`](#the_accounts_list_endpoint) của IdP ở điểm sau trong luồng FedCM.
- `"logged-out"`: Tất cả tài khoản IdP hiện đã đăng xuất.
- `"unknown"`: Trạng thái đăng nhập của IdP này không được biết. Đây là giá trị mặc định.

### Đặt trạng thái đăng nhập

IdP nên cập nhật trạng thái đăng nhập khi người dùng đăng nhập hoặc đăng xuất khỏi IdP. Điều này có thể được thực hiện theo hai cách khác nhau:

- Tiêu đề phản hồi HTTP {{httpheader("Set-Login")}} có thể được đặt trong điều hướng cấp cao nhất hoặc yêu cầu tài nguyên con cùng nguồn gốc:

  ```http
  Set-Login: logged-in

  Set-Login: logged-out
  ```

- Phương thức {{domxref("NavigatorLogin.setStatus", "Navigator.login.setStatus()")}} có thể được gọi từ nguồn gốc IdP:

  ```js
  /* Đặt trạng thái đã đăng nhập */
  navigator.login.setStatus("logged-in");

  /* Đặt trạng thái đã đăng xuất */
  navigator.login.setStatus("logged-out");
  ```

### Trạng thái đăng nhập ảnh hưởng đến luồng đăng nhập liên danh như thế nào

Khi [RP thử đăng nhập liên danh](/vi/docs/Web/API/FedCM_API/RP_sign-in), trạng thái đăng nhập sẽ được kiểm tra:

- Nếu trạng thái đăng nhập của IdP là `"logged-in"`, một yêu cầu sẽ được gửi đến [điểm cuối danh sách tài khoản](#the_accounts_list_endpoint) và các tài khoản khả dụng để đăng nhập sẽ được hiển thị cho người dùng trong hộp thoại FedCM do trình duyệt cung cấp.
- Nếu tất cả trạng thái đăng nhập của IdP đều là `"logged-out"`, promise trả về bởi yêu cầu `get()` FedCM sẽ từ chối mà không gửi yêu cầu đến điểm cuối danh sách tài khoản. Trong trường hợp này, nhà phát triển cần xử lý luồng, ví dụ: nhắc người dùng đi đăng nhập vào một IdP phù hợp.
- Nếu trạng thái đăng nhập của IdP là `"unknown"`, một yêu cầu sẽ được gửi đến điểm cuối danh sách tài khoản và trạng thái đăng nhập được cập nhật tùy thuộc vào phản hồi:
  - Nếu điểm cuối trả về danh sách tài khoản khả dụng để đăng nhập, cập nhật trạng thái thành `"logged-in"` và hiển thị các tùy chọn đăng nhập cho người dùng trong hộp thoại FedCM do trình duyệt cung cấp.
  - Nếu điểm cuối không trả về tài khoản nào, cập nhật trạng thái thành `"logged-out"`; promise trả về bởi yêu cầu `get()` FedCM sẽ từ chối nếu không có IdP `logged-in` nào khác khả dụng.

### Điều gì xảy ra nếu trạng thái đăng nhập của trình duyệt và IdP không đồng bộ?

Mặc dù Login Status API thông báo cho trình duyệt về trạng thái đăng nhập IdP, nhưng trình duyệt và IdP vẫn có thể không đồng bộ. Ví dụ: phiên IdP có thể hết hạn, nghĩa là tất cả tài khoản người dùng cuối cùng đăng xuất nhưng trạng thái đăng nhập vẫn được đặt thành `"logged-in"` (ứng dụng không thể đặt trạng thái đăng nhập thành `"logged-out"`). Trong trường hợp này, khi đăng nhập liên danh được thử, một yêu cầu sẽ được gửi đến điểm cuối danh sách tài khoản của IdP nhưng không có tài khoản khả dụng nào được trả về vì phiên không còn khả dụng.

Khi điều này xảy ra, trình duyệt có thể cho phép người dùng đăng nhập vào IdP một cách linh hoạt bằng cách mở trang đăng nhập của IdP trong hộp thoại (URL đăng nhập được tìm thấy trong `login_url` của [tệp cấu hình](#provide_a_config_file_and_endpoints) IdP). Bản chất chính xác của luồng này tùy thuộc vào trình duyệt; ví dụ: [Chrome xử lý như thế này](https://privacysandbox.google.com/blog/fedcm-chrome-120-updates#what_if_the_user_session_expires_let_the_user_sign_in_through_a_dynamic_login_flow).

Sau khi người dùng đăng nhập vào IdP, IdP sẽ:

- Thông báo cho trình duyệt rằng người dùng đã đăng nhập bằng cách [đặt trạng thái đăng nhập](#setting_login_status) thành `"logged-in"`.
- Đóng hộp thoại đăng nhập bằng cách gọi phương thức {{domxref("IdentityProvider.close_static", "IdentityProvider.close()")}}.

## Xem thêm

- [Federated Credential Management API](https://developer.chrome.com/docs/identity/fedcm/overview) trên developer.chrome.com (2023)
