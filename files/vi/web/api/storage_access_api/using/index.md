---
title: Sử dụng Storage Access API
slug: Web/API/Storage_Access_API/Using
page-type: guide
---

{{DefaultAPISidebar("Storage Access API")}}

[Storage Access API](/en-US/docs/Web/API/Storage_Access_API) có thể được sử dụng bởi các tài liệu cross-site nhúng để xác minh xem chúng có quyền truy cập vào [cookie bên thứ ba](/en-US/docs/Web/Privacy/Guides/Third-party_cookies) và [trạng thái không phân vùng](/en-US/docs/Web/Privacy/Guides/State_Partitioning#state_partitioning) không, và nếu không, để yêu cầu quyền truy cập. Chúng ta sẽ xem qua một kịch bản truy cập lưu trữ phổ biến.

> [!NOTE]
> Khi chúng ta nói về cookie bên thứ ba trong nội dung của Storage Access API, chúng ta ngầm ý là cookie bên thứ ba [_không phân vùng_](/en-US/docs/Web/API/Storage_Access_API#unpartitioned_versus_partitioned_cookies).

## Ghi chú sử dụng

Storage Access API được thiết kế để cho phép nội dung nhúng yêu cầu quyền truy cập vào cookie bên thứ ba và trạng thái không phân vùng — hầu hết các trình duyệt hiện đại chặn quyền truy cập như vậy theo mặc định để bảo vệ quyền riêng tư của người dùng. Vì nội dung nhúng sẽ không biết hành vi của trình duyệt là gì trong vấn đề này, tốt nhất là luôn kiểm tra xem {{htmlelement("iframe")}} nhúng có quyền truy cập lưu trữ không trước khi cố gắng đọc hoặc ghi cookie. Điều này đặc biệt đúng với quyền truy cập {{domxref("Document.cookie")}}, vì các trình duyệt thường trả về cookie jar trống khi quyền truy cập cookie bên thứ ba bị chặn.

Trong ví dụ dưới đây, chúng ta cho thấy cách {{htmlelement("iframe")}} cross-site nhúng có thể truy cập cookie bên thứ ba và trạng thái không phân vùng dưới chính sách truy cập lưu trữ trình duyệt mà nếu không sẽ chặn quyền truy cập chúng.

## Cho phép \<iframe> được sandbox sử dụng API

Trước tiên, nếu `<iframe>` được sandbox, trang web nhúng cần thêm [sandbox token](/en-US/docs/Web/HTML/Reference/Elements/iframe#sandbox) `allow-storage-access-by-user-activation` để cho phép các yêu cầu Storage Access API thành công, cùng với `allow-scripts` và `allow-same-origin` để cho phép nó thực thi script để gọi API và thực thi nó trong nguồn gốc có thể có cookie và trạng thái:

```html
<iframe
  sandbox="allow-storage-access-by-user-activation
                 allow-scripts
                 allow-same-origin">
  …
</iframe>
```

## Kiểm tra và yêu cầu quyền truy cập lưu trữ

Bây giờ đến đoạn code được thực thi bên trong tài liệu nhúng. Trong code này:

1. Trước tiên chúng ta sử dụng phát hiện tính năng (`if (document.hasStorageAccess) {}`) để kiểm tra xem API có được hỗ trợ không. Nếu không, chúng ta chạy code truy cập cookie của mình và hy vọng nó hoạt động. Nó nên được lập trình để xử lý những tình huống như vậy.
2. Nếu API được hỗ trợ, chúng ta gọi `document.hasStorageAccess()`.
3. Nếu lệnh gọi đó trả về `true`, điều đó có nghĩa là {{htmlelement("iframe")}} này đã có quyền truy cập, và chúng ta có thể chạy code truy cập cookie và trạng thái ngay lập tức.
4. Nếu lệnh gọi đó trả về `false`, chúng ta gọi {{domxref("Permissions.query()")}} để kiểm tra xem quyền truy cập cookie bên thứ ba và trạng thái không phân vùng đã được cấp chưa (tức là cho embed cùng trang web khác). Chúng ta bọc toàn bộ phần này trong khối [`try...catch`](/en-US/docs/Web/JavaScript/Reference/Statements/try...catch) vì [một số trình duyệt không hỗ trợ quyền `"storage-access"`](/en-US/docs/Web/API/Storage_Access_API#api.permissions.permission_storage-access), điều này có thể khiến lệnh gọi `query()` ném lỗi.
5. Nếu trạng thái quyền là `"granted"`, chúng ta ngay lập tức gọi `document.requestStorageAccess()`. Lệnh gọi này sẽ tự động phân giải, tiết kiệm thời gian cho người dùng, sau đó chúng ta có thể chạy code truy cập cookie và trạng thái.
6. Nếu trạng thái quyền là `"prompt"`, chúng ta gọi `document.requestStorageAccess()` sau tương tác người dùng. Lệnh gọi này có thể kích hoạt lời nhắc cho người dùng. Nếu lệnh gọi này phân giải, chúng ta có thể chạy code truy cập cookie và trạng thái.
7. Nếu trạng thái quyền là `"denied"`, người dùng đã từ chối các yêu cầu của chúng ta để truy cập cookie bên thứ ba hoặc trạng thái không phân vùng, và code của chúng ta không thể sử dụng chúng.

```js
function doThingsWithCookies() {
  document.cookie = "foo=bar"; // đặt cookie
}

function doThingsWithLocalStorage(handle) {
  handle.localStorage.setItem("foo", "bar"); // đặt khóa local storage
}

async function handleCookieAccess() {
  if (!document.hasStorageAccess) {
    // Trình duyệt này không hỗ trợ Storage Access API
    // vì vậy hãy hy vọng chúng ta có quyền truy cập!
    doThingsWithCookies();
  } else {
    const hasAccess = await document.hasStorageAccess();
    if (hasAccess) {
      // Chúng ta có quyền truy cập vào cookie bên thứ ba, vì vậy hãy tiếp tục
      doThingsWithCookies();
      // Nếu chúng ta muốn sửa đổi trạng thái không phân vùng, chúng ta cần yêu cầu một handle.
      const handle = await document.requestStorageAccess({
        localStorage: true,
      });
      doThingsWithLocalStorage(handle);
    } else {
      // Kiểm tra xem quyền truy cập cookie bên thứ ba đã được cấp chưa
      // cho embed cùng trang web khác
      try {
        const permission = await navigator.permissions.query({
          name: "storage-access",
        });

        if (permission.state === "granted") {
          // Nếu vậy, bạn có thể gọi requestStorageAccess() mà không cần tương tác người dùng,
          // và nó sẽ tự động phân giải.
          const handle = await document.requestStorageAccess({
            cookies: true,
            localStorage: true,
          });
          doThingsWithLocalStorage(handle);
          doThingsWithCookies();
        } else if (permission.state === "prompt") {
          // Cần gọi requestStorageAccess() sau tương tác người dùng
          btn.addEventListener("click", async () => {
            try {
              const handle = await document.requestStorageAccess({
                cookies: true,
                localStorage: true,
              });
              doThingsWithLocalStorage(handle);
              doThingsWithCookies();
            } catch (err) {
              // Nếu có lỗi khi lấy quyền truy cập lưu trữ.
              console.error(`Lỗi khi lấy quyền truy cập lưu trữ: ${err}.
                            Vui lòng đăng nhập.`);
            }
          });
        } else if (permission.state === "denied") {
          // Người dùng đã từ chối quyền truy cập cookie bên thứ ba, vì vậy chúng ta sẽ
          // cần làm điều gì đó khác
        }
      } catch (error) {
        console.log(`Không thể truy cập trạng thái quyền. Lỗi: ${error}`);
        doThingsWithCookies(); // Một lần nữa, chúng ta sẽ phải hy vọng chúng ta có quyền truy cập!
      }
    }
  }
}
```

> [!NOTE]
> Các yêu cầu `requestStorageAccess()` tự động bị từ chối trừ khi nội dung nhúng hiện đang xử lý một cử chỉ người dùng như nhấn hoặc click ({{Glossary("transient activation")}}), hoặc nếu quyền đã được cấp trước đó. Nếu quyền chưa được cấp trước đó, các yêu cầu `requestStorageAccess()` phải được chạy bên trong trình xử lý sự kiện dựa trên cử chỉ người dùng, như được hiển thị ở trên.

### Tập hợp website liên quan

Tính năng [tập hợp website liên quan](/en-US/docs/Web/API/Storage_Access_API/Related_website_sets) chỉ dành cho Chrome có thể được coi là cơ chế cải tiến lũy tiến hoạt động cùng với Storage Access API — các trình duyệt hỗ trợ cấp quyền truy cập cookie bên thứ ba và trạng thái không phân vùng mặc định giữa các website trong cùng tập hợp. Điều này có nghĩa là không cần phải trải qua quy trình lời nhắc quyền người dùng thông thường được mô tả ở trên, mang lại trải nghiệm thân thiện hơn với người dùng của các trang trong tập hợp.

## Yêu cầu quyền truy cập lưu trữ từ trang cấp cao nhất thay mặt cho tài nguyên nhúng

Các tính năng Storage Access API ở trên cho phép tài liệu nhúng yêu cầu quyền truy cập cookie bên thứ ba của riêng nó. Có một phương thức thực nghiệm bổ sung, {{domxref("Document.requestStorageAccessFor()")}}, một phần mở rộng đề xuất cho Storage Access API cho phép các trang cấp cao nhất yêu cầu quyền truy cập lưu trữ thay mặt cho các nguồn gốc liên quan cụ thể.

Phương thức `requestStorageAccessFor()` giải quyết các thách thức trong việc áp dụng Storage Access API trên các trang cấp cao nhất sử dụng hình ảnh hoặc script cross-site yêu cầu cookie. Nó có thể kích hoạt quyền truy cập cookie bên thứ ba cho các tài nguyên cross-site được nhúng trực tiếp vào trang cấp cao nhất không thể yêu cầu quyền truy cập lưu trữ của riêng chúng, ví dụ thông qua các phần tử {{htmlelement("img")}} hoặc {{htmlelement("script")}}.

Để `requestStorageAccessFor()` hoạt động, cả trang cấp cao nhất gọi và tài nguyên nhúng mà nó đang yêu cầu quyền truy cập lưu trữ đều cần phải là một phần của cùng [tập hợp website liên quan](/en-US/docs/Web/API/Storage_Access_API/Related_website_sets).

Cách sử dụng điển hình của `requestStorageAccessFor()` trông như thế này:

```js
navigator.permissions
  .query({
    name: "top-level-storage-access",
    requestedOrigin: "https://example.com",
  })
  .then((permission) => {
    if (permission.state === "granted") {
      // Quyền đã được cấp
      // Không cần gọi requestStorageAccessFor() nữa, chỉ cần bắt đầu sử dụng cookie
      doThingsWithCookies();
    } else if (permission.state === "prompt") {
      // Cần gọi requestStorageAccessFor() sau tương tác người dùng
      btn.addEventListener("click", () => {
        // Yêu cầu quyền truy cập lưu trữ
        rSAFor();
      });
    } else if (permission.state === "denied") {
      // Người dùng đã từ chối quyền truy cập cookie bên thứ ba, vì vậy chúng ta sẽ
      // cần làm điều gì đó khác
    }
  });

function rSAFor() {
  if ("requestStorageAccessFor" in document) {
    document.requestStorageAccessFor("https://example.com").then(
      (res) => {
        doThingsWithCookies();
      },
      (err) => {
        // Xử lý lỗi
      },
    );
  }
}
```

Sau khi quyền `"top-level-storage-access"` được cấp, các yêu cầu cross-site sẽ bao gồm cookie nếu chúng bao gồm [CORS](/en-US/docs/Web/HTTP/Guides/CORS) / [`crossorigin`](/en-US/docs/Web/HTML/Reference/Attributes/crossorigin), vì vậy các trang có thể muốn chờ trước khi kích hoạt yêu cầu. Các yêu cầu như vậy phải sử dụng tùy chọn [`credentials: "include"`](/en-US/docs/Web/API/RequestInit#credentials) và các tài nguyên phải bao gồm thuộc tính `crossorigin="use-credentials"`.

Ví dụ:

```js
function checkCookie() {
  fetch("https://example.com/getcookies.json", {
    method: "GET",
    credentials: "include",
  })
    .then((response) => response.json())
    .then((json) => {
      // Làm điều gì đó
    });
}
```
