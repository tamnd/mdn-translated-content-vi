---
title: Lỗi WebDriver
short-title: Lỗi
slug: Web/WebDriver/Reference/Errors
page-type: landing-page
sidebar: webdriver
---

Bất kỳ [lệnh](/en-US/docs/Web/WebDriver/Reference/Classic/Commands) WebDriver classic nào được gửi đi đều có thể nhận được một phản hồi lỗi. Lỗi được biểu diễn bằng một [phản hồi HTTP](/en-US/docs/Web/HTTP) với [mã trạng thái HTTP](/en-US/docs/Web/HTTP/Reference/Status) trong khoảng 4xx hoặc 5xx, và một payload JSON chứa chi tiết của lỗi.

## Payload

**error object** là một JSON Object có ba, và đôi khi bốn, trường:

- `error`
  - : Kiểu lỗi.
- `message`
  - : Mô tả ngắn gọn, dễ đọc của bản chất lỗi.
- `stacktrace`
  - : Báo cáo stacktrace của các frame stack đang hoạt động tại thời điểm lỗi xảy ra.
- `data` (optional)
  - : Dữ liệu tùy ý, do cách triển khai xác định, có thể hữu ích khi hiển thị cho người dùng.
    Nhiều driver bao gồm văn bản của [user prompt](/en-US/docs/Web/API/Window/alert) khi gặp lỗi [unexpected alert open](/en-US/docs/Web/WebDriver/Reference/Errors/UnexpectedAlertOpen).

## Ví dụ

Ví dụ, một yêu cầu [`GET`](/en-US/docs/Web/HTTP/Reference/Methods/GET) tới `/session/1234/url`, trong đó `1234` là một session giả, sẽ trả về phản hồi với trạng thái {{HTTPStatus(404, "404 Not Found")}} và phần thân sau:

```json
{
  "value": {
    "error": "invalid session id",
    "message": "No active session with ID 1234",
    "stacktrace": ""
  }
}
```

Việc driver chú thích lỗi bằng dữ liệu lỗi bổ sung là tùy chọn. Đáng chú ý là điều này thường gặp khi một user prompt, chẳng hạn `window.alert`, đã mở một hộp thoại modal sau khi thực thi yêu cầu lệnh WebDriver trước đó của bạn.

Vì cả WebDriver lẫn việc thực thi JavaScript đều bị dừng bởi hộp thoại như vậy, nên chúng ta thấy lỗi [unexpected alert open](/en-US/docs/Web/WebDriver/Reference/Errors/UnexpectedAlertOpen) trong phản hồi tiếp theo:

```json
{
  "value": {
    "error": "unexpected alert open",
    "message": "",
    "stacktrace": "",
    "data": {
      "text": "Message from window.alert"
    }
  }
}
```

Trong hầu hết [client](/en-US/docs/Web/WebDriver/Reference/Clients), lỗi sẽ được biểu diễn bằng một dạng _type_ lỗi hoặc _representation_ của object. Trong Python nó được biểu diễn như một [`WebDriverException`](https://www.selenium.dev/selenium/docs/api/py/selenium_common/selenium.common.exceptions.html), trong Node.js là một [`WebDriverError`](https://www.selenium.dev/selenium/docs/api/javascript/WebDriverError.html), và trong Java cũng là một [`WebDriverException`](https://www.selenium.dev/selenium/docs/api/java/org/openqa/selenium/WebDriverException.html).

## Bảng lỗi

| Error type                                                                                      | HTTP status code                                 | Description                                                                                                                                                                                                                                                  |
| ----------------------------------------------------------------------------------------------- | ------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| [element click intercepted](/en-US/docs/Web/WebDriver/Reference/Errors/ElementClickIntercepted) | {{HTTPStatus(400, "400 Bad Request")}}           | Lệnh [Element Click](/en-US/docs/Web/WebDriver/Reference/ElementClick) không thể hoàn tất vì [element](/en-US/docs/Web/WebDriver/Reference/WebElement) nhận các sự kiện đang che khuất phần tử được yêu cầu nhấp.                                            |
| [element not interactable](/en-US/docs/Web/WebDriver/Reference/Errors/ElementNotInteractable)   | {{HTTPStatus(400, "400 Bad Request")}}           | Một [lệnh](/en-US/docs/Web/WebDriver/Reference/Command) không thể hoàn tất vì phần tử không thể tương tác bằng chuột hoặc bàn phím.                                                                                                                          |
| [insecure certificate](/en-US/docs/Web/WebDriver/Reference/Errors/InsecureCertificate)          | {{HTTPStatus(400, "400 Bad Request")}}           | Việc điều hướng khiến user agent gặp cảnh báo chứng chỉ, thường là do [TLS certificate](/en-US/docs/Glossary/TLS) đã hết hạn hoặc không hợp lệ.                                                                                                              |
| [invalid argument](/en-US/docs/Web/WebDriver/Reference/Errors/InvalidArgument)                  | {{HTTPStatus(400, "400 Bad Request")}}           | Các đối số truyền cho một [lệnh](/en-US/docs/Web/WebDriver/Reference/Command) không hợp lệ hoặc bị định dạng sai.                                                                                                                                            |
| [invalid cookie domain](/en-US/docs/Web/WebDriver/Reference/Errors/InvalidCookieDomain)         | {{HTTPStatus(400, "400 Bad Request")}}           | Đã có một nỗ lực không hợp lệ nhằm đặt cookie dưới một miền khác với trang hiện tại.                                                                                                                                                                         |
| [invalid element state](/en-US/docs/Web/WebDriver/Reference/Errors/InvalidElementState)         | {{HTTPStatus(400, "400 Bad Request")}}           | Một [lệnh](/en-US/docs/Web/WebDriver/Reference/Command) không thể hoàn tất vì phần tử đang ở trạng thái không hợp lệ, ví dụ như cố gắng [clear](/en-US/docs/Web/WebDriver/Reference/ElementClear) một phần tử không vừa có thể chỉnh sửa vừa có thể đặt lại. |
| [invalid selector](/en-US/docs/Web/WebDriver/Reference/Errors/InvalidSelector)                  | {{HTTPStatus(400, "400 Bad Request")}}           | Một lệnh truy xuất phần tử đã cung cấp một chiến lược selector không xác định.                                                                                                                                                                               |
| [invalid session id](/en-US/docs/Web/WebDriver/Reference/Errors/InvalidSessionID)               | {{HTTPStatus(404, "404 Not Found")}}             | Session ID được cung cấp không được nhận diện, nghĩa là phiên hoặc không tồn tại hoặc không còn hoạt động. Lưu ý rằng một phiên đã [bị xóa](/en-US/docs/Web/WebDriver/Reference/DeleteSession) thì không thể dùng lại.                                       |
| [JavaScript error](/en-US/docs/Web/WebDriver/Reference/Errors/JavaScriptError)                  | {{HTTPStatus(500, "500 Internal Server Error")}} | Đã xảy ra lỗi khi thực thi JavaScript do người dùng cung cấp.                                                                                                                                                                                                |
| [move target out of bounds](/en-US/docs/Web/WebDriver/Reference/Errors/MoveTargetOutOfBounds)   | {{HTTPStatus(500, "500 Internal Server Error")}} | Mục tiêu cho tương tác chuột không nằm trong viewport của trình duyệt và không thể được đưa vào viewport đó.                                                                                                                                                 |
| [no such alert](/en-US/docs/Web/WebDriver/Reference/Errors/NoSuchAlert)                         | {{HTTPStatus(404, "404 Not Found")}}             | Đã cố thao tác với một user prompt khi không có prompt nào đang mở.                                                                                                                                                                                          |
| [no such cookie](/en-US/docs/Web/WebDriver/Reference/Errors/NoSuchCookie)                       | {{HTTPStatus(404, "404 Not Found")}}             | Không tìm thấy cookie nào khớp với đường dẫn đã cho trong số [cookies](/en-US/docs/Glossary/Cookie) của [document](/en-US/docs/Web/API/Document) hiện tại.                                                                                                   |
| [no such element](/en-US/docs/Web/WebDriver/Reference/Errors/NoSuchElement)                     | {{HTTPStatus(404, "404 Not Found")}}             | Không thể định vị một phần tử trên trang bằng các tham số tìm kiếm đã cho.                                                                                                                                                                                   |
| [no such frame](/en-US/docs/Web/WebDriver/Reference/Errors/NoSuchFrame)                         | {{HTTPStatus(404, "404 Not Found")}}             | Một [lệnh](/en-US/docs/Web/WebDriver/Reference/Command) để chuyển sang frame không thể được đáp ứng vì không tìm thấy frame đó.                                                                                                                              |
| [no such window](/en-US/docs/Web/WebDriver/Reference/Errors/NoSuchWindow)                       | {{HTTPStatus(404, "404 Not Found")}}             | Một [lệnh](/en-US/docs/Web/WebDriver/Reference/Command) để chuyển sang cửa sổ không thể được đáp ứng vì không tìm thấy cửa sổ đó.                                                                                                                            |
| [script timeout](/en-US/docs/Web/WebDriver/Reference/Errors/ScriptTimeout)                      | {{HTTPStatus(408, "408 Request Timeout")}}       | Một script không hoàn thành trước khi timeout hết hạn.                                                                                                                                                                                                       |
| [session not created](/en-US/docs/Web/WebDriver/Reference/Errors/SessionNotCreated)             | {{HTTPStatus(500, "500 Internal Server Error")}} | Không thể tạo phiên mới, hoặc vì trình duyệt không thể khởi động, hoặc vì [capabilities](/en-US/docs/Web/WebDriver/Reference/Capabilities) được cung cấp để khởi tạo phiên không khớp.                                                                       |
| [stale element reference](/en-US/docs/Web/WebDriver/Reference/Errors/StaleElementReference)     | {{HTTPStatus(404, "404 Not Found")}}             | Một [lệnh](/en-US/docs/Web/WebDriver/Reference/Command) thất bại vì [element](/en-US/docs/Web/WebDriver/Reference/WebElement) được tham chiếu không còn được gắn vào DOM.                                                                                    |
| [timeout](/en-US/docs/Web/WebDriver/Reference/Errors/Timeout)                                   | {{HTTPStatus(408, "408 Request Timeout")}}       | Một thao tác không hoàn thành trước khi timeout hết hạn.                                                                                                                                                                                                     |
| [unable to set cookie](/en-US/docs/Web/WebDriver/Reference/Errors/UnableToSetCookie)            | {{HTTPStatus(500, "500 Internal Server Error")}} | Một [lệnh](/en-US/docs/Web/WebDriver/Reference/Command) để đặt giá trị cookie không thể được đáp ứng.                                                                                                                                                        |
| [unable to capture screen](/en-US/docs/Web/WebDriver/Reference/Errors/UnableToCaptureScreen)    | {{HTTPStatus(500, "500 Internal Server Error")}} | Không thể thực hiện chụp màn hình.                                                                                                                                                                                                                           |
| [unexpected alert open](/en-US/docs/Web/WebDriver/Reference/Errors/UnexpectedAlertOpen)         | {{HTTPStatus(500, "500 Internal Server Error")}} | Một hộp thoại modal đang mở, chặn thao tác này.                                                                                                                                                                                                              |
| [unknown command](/en-US/docs/Web/WebDriver/Reference/Errors/UnknownCommand)                    | {{HTTPStatus(404, "404 Not Found")}}             | Một [lệnh](/en-US/docs/Web/WebDriver/Reference/Command) không thể thực thi vì driver không biết đến nó.                                                                                                                                                      |
| [unknown error](/en-US/docs/Web/WebDriver/Reference/Errors/UnknownError)                        | {{HTTPStatus(500, "500 Internal Server Error")}} | Đã xảy ra một lỗi không xác định trong driver khi xử lý [lệnh](/en-US/docs/Web/WebDriver/Reference/Command).                                                                                                                                                 |
| [unknown method](/en-US/docs/Web/WebDriver/Reference/Errors/UnknownMethod)                      | {{HTTPStatus(405, "405 Method Not Allowed")}}    | [Lệnh](/en-US/docs/Web/WebDriver/Reference/Command) được yêu cầu khớp với một URL đã biết nhưng không khớp với phương thức cho URL đó.                                                                                                                       |
| [unsupported operation](/en-US/docs/Web/WebDriver/Reference/Errors/UnsupportedOperation)        | {{HTTPStatus(500, "500 Internal Server Error")}} | Cho biết rằng một [lệnh](/en-US/docs/Web/WebDriver/Reference/Command) đáng lẽ phải thực thi đúng cách nhưng vì một lý do nào đó không thể được hỗ trợ.                                                                                                       |

## Xem thêm

- [Phản hồi WebDriver](/en-US/docs/Web/WebDriver/Reference/Response)
- [Lệnh WebDriver](/en-US/docs/Web/WebDriver/Reference/Classic/Commands)
