---
title: "Hướng dẫn Django Phần 11: Triển khai Django lên môi trường production"
short-title: "11: Triển khai"
slug: Learn_web_development/Extensions/Server-side/Django/Deployment
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Extensions/Server-side/Django/Testing", "Learn_web_development/Extensions/Server-side/Django/web_application_security", "Learn_web_development/Extensions/Server-side/Django")}}

Bạn đã tạo và kiểm thử ví dụ trang web sử dụng Django, vì vậy bây giờ đã đến lúc cài đặt nó lên một máy chủ web để bất kỳ ai cũng có thể truy cập qua Internet công cộng.
Trang này mô tả cách lưu trữ một dự án Django và những gì bạn cần chuẩn bị để triển khai trang web lên môi trường production.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>
        Hoàn thành tất cả các chủ đề hướng dẫn trước, bao gồm <a href="/en-US/docs/Learn_web_development/Extensions/Server-side/Django/Testing">Django Tutorial Part 10: Testing a Django web application</a>.
      </td>
    </tr>
    <tr>
      <th scope="row">Mục tiêu:</th>
      <td>Tìm hiểu nơi và cách bạn có thể triển khai ứng dụng Django lên môi trường production.</td>
    </tr>
  </tbody>
</table>

## Tổng quan

Khi trang web của bạn đã hoàn thành (hoặc hoàn thành "đủ" để bắt đầu kiểm thử công khai), bạn sẽ cần lưu trữ nó ở một nơi công khai và dễ tiếp cận hơn so với máy tính phát triển cá nhân của bạn.

Cho đến nay bạn đã làm việc trong môi trường phát triển, sử dụng máy chủ web phát triển Django để chia sẻ trang web với trình duyệt/mạng cục bộ, và chạy trang web với cài đặt phát triển (không an toàn) để hiển thị thông tin debug và các thông tin riêng tư khác. Trước khi lưu trữ trang web ra bên ngoài, trước tiên bạn cần:

- Thực hiện một vài thay đổi với cài đặt dự án.
- Chọn một môi trường để lưu trữ ứng dụng Django.
- Chọn một môi trường để lưu trữ các tệp tĩnh.
- Thiết lập cơ sở hạ tầng cấp production để phục vụ trang web của bạn.

Hướng dẫn này cung cấp một số hướng dẫn về các tùy chọn chọn trang web lưu trữ, tổng quan ngắn gọn về những gì bạn cần làm để chuẩn bị ứng dụng Django cho production, và ví dụ thực tế về cách cài đặt trang web LocalLibrary lên dịch vụ lưu trữ đám mây [Railway](https://railway.com/).

## Môi trường production là gì?

Môi trường production là môi trường do máy chủ cung cấp, nơi bạn sẽ chạy trang web để phục vụ người dùng bên ngoài. Môi trường bao gồm:

- Phần cứng máy tính mà trang web chạy trên đó.
- Hệ điều hành (ví dụ: Linux, Windows).
- Ngôn ngữ lập trình runtime và thư viện framework mà trang web được viết trên đó.
- Máy chủ web được sử dụng để phục vụ trang và nội dung khác (ví dụ: Nginx, Apache).
- Máy chủ ứng dụng chuyển các yêu cầu "động" giữa trang web Django và máy chủ web.
- Cơ sở dữ liệu mà trang web phụ thuộc vào.

> [!NOTE]
> Tùy thuộc vào cách môi trường production của bạn được cấu hình, bạn cũng có thể có reverse proxy, cân bằng tải, v.v.

Máy chủ có thể nằm tại cơ sở của bạn và kết nối với Internet qua đường truyền nhanh, nhưng phổ biến hơn là sử dụng máy tính được lưu trữ "trên đám mây". Điều này thực sự có nghĩa là mã của bạn được chạy trên một máy tính từ xa (hoặc có thể là máy tính "ảo") trong trung tâm dữ liệu của công ty lưu trữ. Máy chủ từ xa thường cung cấp một mức đảm bảo nhất định về tài nguyên tính toán (CPU, RAM, bộ nhớ lưu trữ, v.v.) và kết nối Internet với một mức giá nhất định.

Loại phần cứng tính toán/mạng có thể truy cập từ xa này được gọi là _Infrastructure as a Service (IaaS)_. Nhiều nhà cung cấp IaaS cung cấp tùy chọn cài đặt trước một hệ điều hành cụ thể, mà bạn phải cài đặt các thành phần khác của môi trường production lên đó. Các nhà cung cấp khác cho phép bạn chọn môi trường đầy đủ tính năng hơn, có thể bao gồm cài đặt Django và máy chủ web hoàn chỉnh.

> [!NOTE]
> Môi trường được xây dựng sẵn có thể giúp việc thiết lập trang web rất dễ dàng vì chúng giảm thiểu cấu hình, nhưng các tùy chọn có sẵn có thể giới hạn bạn vào một máy chủ không quen thuộc (hoặc các thành phần khác) và có thể dựa trên phiên bản cũ hơn của hệ điều hành. Thường tốt hơn là tự cài đặt các thành phần để bạn có được những gì bạn muốn, và khi bạn cần nâng cấp các phần của hệ thống, bạn biết bắt đầu từ đâu!

Các nhà cung cấp lưu trữ khác hỗ trợ Django như một phần của dịch vụ _Platform as a Service_ (PaaS). Trong loại lưu trữ này, bạn không cần lo lắng về hầu hết môi trường production của mình (máy chủ web, máy chủ ứng dụng, cân bằng tải) vì nền tảng lưu trữ xử lý điều đó cho bạn — cùng với hầu hết những gì bạn cần làm để mở rộng ứng dụng của mình.
Điều đó làm cho việc triển khai khá dễ dàng, vì bạn chỉ cần tập trung vào ứng dụng web của mình và không phải lo lắng về cơ sở hạ tầng máy chủ khác.

Một số nhà phát triển sẽ chọn tính linh hoạt tăng lên của IaaS so với PaaS, trong khi những người khác sẽ đánh giá cao mức bảo trì giảm và khả năng mở rộng dễ dàng hơn của PaaS. Khi bạn mới bắt đầu, thiết lập trang web trên hệ thống PaaS sẽ dễ dàng hơn nhiều, vì vậy đó là những gì chúng ta sẽ làm trong hướng dẫn này.

> [!NOTE]
> Nếu bạn chọn nhà cung cấp lưu trữ thân thiện với Python/Django, họ nên cung cấp hướng dẫn về cách thiết lập trang web Django bằng các cấu hình khác nhau của máy chủ web, máy chủ ứng dụng, reverse proxy, v.v. (điều này sẽ không liên quan nếu bạn chọn PaaS). Ví dụ: có nhiều hướng dẫn từng bước cho các cấu hình khác nhau trong [tài liệu cộng đồng DigitalOcean Django](https://www.digitalocean.com/community/tutorials?q=django).

## Chọn nhà cung cấp lưu trữ

Có nhiều nhà cung cấp lưu trữ được biết đến là hỗ trợ tích cực hoặc hoạt động tốt với Django, bao gồm: [Heroku](https://www.heroku.com/), [DigitalOcean](https://www.digitalocean.com/), [Railway](https://railway.com/), [Python Anywhere](https://www.pythonanywhere.com/), [Amazon Web Services](https://aws.amazon.com/), [Azure](https://azure.microsoft.com/en-us), [Google Cloud](https://cloud.google.com/), [Hetzner](https://www.hetzner.com/), và [Vultr Cloud Compute](https://blogs.vultr.com/new-free-tier-plan) — chỉ kể tên một vài.
Các nhà cung cấp này cung cấp các loại môi trường khác nhau (IaaS, PaaS), và các mức độ tài nguyên tính toán và mạng khác nhau ở các mức giá khác nhau.

Một số điều cần xem xét khi chọn nhà cung cấp:

- Trang web của bạn có thể sẽ bận như thế nào và chi phí dữ liệu và tài nguyên tính toán cần thiết để đáp ứng nhu cầu đó.
- Mức độ hỗ trợ để mở rộng theo chiều ngang (thêm nhiều máy) và chiều dọc (nâng cấp lên máy mạnh hơn) và chi phí để làm như vậy.
- Nơi nhà cung cấp có trung tâm dữ liệu, và do đó nơi truy cập có thể nhanh nhất.
- Hiệu suất hoạt động và dừng hoạt động lịch sử của nhà cung cấp.
- Các công cụ được cung cấp để quản lý trang web — chúng có dễ sử dụng và an toàn không (ví dụ: SFTP so với FTP).
- Các framework tích hợp để theo dõi máy chủ của bạn.
- Các giới hạn đã biết. Một số máy chủ sẽ cố tình chặn một số dịch vụ nhất định (ví dụ: email). Các máy chủ khác chỉ cung cấp một số giờ "thời gian hoạt động" nhất định trong một số bậc giá, hoặc chỉ cung cấp một lượng nhỏ bộ nhớ lưu trữ.
- Các lợi ích bổ sung. Một số nhà cung cấp sẽ cung cấp tên miền miễn phí và hỗ trợ chứng chỉ TLS mà bạn sẽ phải trả tiền trong trường hợp khác.
- Liệu bậc "miễn phí" mà bạn đang dựa vào có hết hạn theo thời gian không, và liệu chi phí chuyển sang bậc đắt hơn có nghĩa là bạn sẽ tốt hơn nếu sử dụng một dịch vụ khác ngay từ đầu!

Tin tốt khi bạn mới bắt đầu là có khá nhiều trang web cung cấp môi trường tính toán "miễn phí" dành cho đánh giá và kiểm thử.
Đây thường là môi trường khá bị hạn chế/giới hạn về tài nguyên, và bạn cần biết rằng chúng có thể hết hạn sau một thời gian giới thiệu hoặc có các ràng buộc khác.
Tuy nhiên, chúng rất tuyệt vời để kiểm thử các trang web có lưu lượng thấp trong môi trường lưu trữ, và có thể cung cấp sự chuyển đổi dễ dàng sang trả tiền cho nhiều tài nguyên hơn khi trang web của bạn bận hơn.
Các lựa chọn phổ biến trong danh mục này bao gồm [Vultr Cloud Compute](https://blogs.vultr.com/new-free-tier-plan), [Python Anywhere](https://www.pythonanywhere.com/), [Amazon Web Services](https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/billing-free-tier.html), [Microsoft Azure](https://azure.microsoft.com/en-us/pricing/details/app-service/linux/), v.v.

Hầu hết các nhà cung cấp cũng cung cấp bậc "cơ bản" dành cho các trang web production nhỏ, cung cấp mức sức mạnh tính toán hữu ích hơn và ít giới hạn hơn.
[Railway](https://railway.com/), [Heroku](https://www.heroku.com/), và [DigitalOcean](https://www.digitalocean.com/) là các ví dụ về nhà cung cấp lưu trữ phổ biến có bậc tính toán cơ bản tương đối rẻ (trong khoảng $5 đến $10 USD mỗi tháng).

> [!NOTE]
> Hãy nhớ rằng giá không phải là tiêu chí lựa chọn duy nhất. Nếu trang web của bạn thành công, khả năng mở rộng có thể là điều quan trọng nhất cần xem xét.

## Chuẩn bị trang web để xuất bản

[Trang web khung Django](/en-US/docs/Learn_web_development/Extensions/Server-side/Django/skeleton_website) được tạo bằng công cụ _django-admin_ và _manage.py_ được cấu hình để giúp việc phát triển dễ dàng hơn. Nhiều cài đặt dự án Django (được chỉ định trong **settings.py**) nên khác nhau cho production, vì lý do bảo mật hoặc hiệu suất.

> [!NOTE]
> Thông thường có một tệp **settings.py** riêng cho production, và/hoặc nhập có điều kiện các cài đặt nhạy cảm từ một tệp riêng hoặc biến môi trường. Tệp này sau đó nên được bảo vệ, ngay cả khi phần còn lại của mã nguồn có sẵn trên kho lưu trữ công khai.

Các cài đặt quan trọng mà bạn phải kiểm tra là:

- `DEBUG`. Điều này nên được đặt là `False` trong production (`DEBUG = False`). Điều này ngăn chặn thông tin debug/trace bí mật/bảo mật và thông tin biến được hiển thị.
- `SECRET_KEY`. Đây là giá trị ngẫu nhiên lớn được sử dụng cho bảo vệ CSRF, v.v. Điều quan trọng là khóa được sử dụng trong production không nằm trong kiểm soát nguồn hoặc không thể truy cập bên ngoài máy chủ production.

Tài liệu Django đề xuất rằng thông tin bí mật tốt nhất nên được tải từ biến môi trường hoặc đọc từ tệp chỉ dành cho máy chủ.
Hãy thay đổi ứng dụng _LocalLibrary_ để chúng ta đọc các biến `SECRET_KEY` và `DEBUG` từ biến môi trường nếu chúng được định nghĩa, quay lại các giá trị được định nghĩa trong tệp **.env** ở thư mục gốc, và cuối cùng sử dụng các giá trị mặc định trong tệp cấu hình.
Điều này rất linh hoạt vì nó cho phép bất kỳ cấu hình nào được hỗ trợ bởi máy chủ lưu trữ.

Để đọc các giá trị môi trường từ một tệp, chúng ta sẽ sử dụng [python-dotenv](https://pypi.org/project/python-dotenv/).
Đây là thư viện để đọc các cặp khóa-giá trị từ tệp và sử dụng chúng làm biến môi trường, nhưng chỉ khi biến môi trường tương ứng không được định nghĩa.

Cài đặt thư viện vào môi trường ảo của bạn như sau (và cũng cập nhật tệp `requirements.txt` của bạn):

```bash
pip3 install python-dotenv
```

Sau đó mở **/locallibrary/settings.py** và chèn đoạn code sau sau khi `BASE_DIR` được định nghĩa, nhưng trước cảnh báo bảo mật: `# SECURITY WARNING: keep the secret key used in production secret!`

```python
# Support env variables from .env file if defined
import os
from dotenv import load_dotenv

env_path = os.path.join(BASE_DIR, ".env")
if os.path.exists(env_path):
    load_dotenv(env_path)
```

Đoạn code này tải tệp `.env` từ thư mục gốc của ứng dụng web.
Các biến được định nghĩa dạng `KEY=VALUE` trong tệp được nhập khi khóa được sử dụng trong `os.environ.get('<KEY>'', '<DEFAULT VALUE>')`, nếu được định nghĩa.

> [!NOTE]
> Bất kỳ giá trị nào bạn thêm vào **.env** có thể là _bí mật_!
> Bạn không được lưu chúng lên GitHub, và bạn nên thêm `.env` vào tệp `.gitignore` của mình để tránh bị thêm vào một cách vô tình.

Tiếp theo, vô hiệu hóa cấu hình `SECRET_KEY` ban đầu và thêm các dòng mới như được hiển thị bên dưới.
Trong quá trình phát triển sẽ không có biến môi trường nào được chỉ định cho khóa, vì vậy giá trị mặc định sẽ được sử dụng (không quan trọng bạn dùng khóa nào ở đây, hoặc nếu khóa "bị rò rỉ", vì bạn sẽ không sử dụng nó trong production).

```python
# SECURITY WARNING: keep the secret key used in production secret!
# SECRET_KEY = 'django-insecure-&psk#na5l=p3q8_a+-$4w1f^lt3lx1c@d*p4x$ymm_rn7pwb87'
import os
SECRET_KEY = os.environ.get('DJANGO_SECRET_KEY', 'django-insecure-&psk#na5l=p3q8_a+-$4w1f^lt3lx1c@d*p4x$ymm_rn7pwb87')
```

Sau đó comment out cài đặt `DEBUG` hiện có và thêm dòng mới như được hiển thị bên dưới.

```python
# SECURITY WARNING: don't run with debug turned on in production!
# DEBUG = True
DEBUG = os.environ.get('DJANGO_DEBUG', '') != 'False'
```

Giá trị của `DEBUG` sẽ là `True` theo mặc định, nhưng sẽ chỉ là `False` nếu giá trị của biến môi trường `DJANGO_DEBUG` được đặt thành `False` hoặc `DJANGO_DEBUG=False` được đặt trong tệp **.env**.
Lưu ý rằng các biến môi trường là các chuỗi và không phải kiểu Python. Do đó chúng ta cần so sánh các chuỗi. Cách duy nhất để đặt biến `DEBUG` thành `False` là thực sự đặt nó thành chuỗi `False`.

Bạn có thể đặt biến môi trường thành "False" trên Linux bằng cách nhập lệnh sau:

```bash
export DJANGO_DEBUG=False
```

Danh sách kiểm tra đầy đủ về các cài đặt bạn có thể muốn thay đổi được cung cấp trong [Deployment checklist](https://docs.djangoproject.com/en/5.0/howto/deployment/checklist/) (Tài liệu Django). Bạn cũng có thể liệt kê một số trong số này bằng lệnh terminal bên dưới:

```python
python3 manage.py check --deploy
```

### Gunicorn

[Gunicorn](https://gunicorn.org/) là một máy chủ HTTP Python thuần túy thường được sử dụng để phục vụ các ứng dụng Django WSGI.

Mặc dù chúng ta không cần _Gunicorn_ để phục vụ ứng dụng LocalLibrary của mình trong quá trình phát triển, chúng ta sẽ cài đặt nó cục bộ để nó trở thành một phần của [requirements](#requirements) khi ứng dụng được triển khai.

Đầu tiên hãy đảm bảo rằng bạn đang ở trong môi trường ảo Python đã được tạo khi bạn [thiết lập môi trường phát triển](/en-US/docs/Learn_web_development/Extensions/Server-side/Django/development_environment) (sử dụng lệnh `workon [name-of-virtual-environment]`).
Sau đó cài đặt _Gunicorn_ cục bộ trên dòng lệnh bằng _pip_:

```bash
pip3 install gunicorn
```

### Cấu hình cơ sở dữ liệu

SQLite, cơ sở dữ liệu Django mặc định mà bạn đã sử dụng để phát triển, là lựa chọn hợp lý cho các trang web nhỏ đến vừa.
Thật không may, nó không thể được sử dụng trên một số dịch vụ lưu trữ phổ biến, chẳng hạn như Heroku, vì chúng không cung cấp bộ nhớ dữ liệu liên tục trong môi trường ứng dụng (yêu cầu của SQLite).
Mặc dù điều đó có thể không ảnh hưởng đến chúng ta trong ví dụ triển khai này, chúng ta sẽ chỉ cho bạn một cách tiếp cận khác sẽ hoạt động trên Railway, Heroku, và một số dịch vụ khác.

Cách tiếp cận là sử dụng cơ sở dữ liệu chạy trong quá trình riêng của nó ở đâu đó trên Internet, và được truy cập bởi ứng dụng thư viện Django bằng một địa chỉ được truyền như biến môi trường.
Trong trường hợp này chúng ta sẽ sử dụng cơ sở dữ liệu Postgres cũng được lưu trữ trên Railway, nhưng bạn có thể sử dụng bất kỳ dịch vụ lưu trữ cơ sở dữ liệu nào bạn thích.

Thông tin kết nối cơ sở dữ liệu sẽ được cung cấp cho Django bằng biến môi trường có tên `DATABASE_URL`.
Thay vì hard-coding thông tin này vào Django, chúng ta sẽ sử dụng gói [dj-database-url](https://pypi.org/project/dj-database-url/) để phân tích biến môi trường `DATABASE_URL` và tự động chuyển đổi nó sang định dạng cấu hình mong muốn của Django.
Ngoài việc cài đặt gói _dj-database-url_, chúng ta cũng cần cài đặt [psycopg2](https://www.psycopg.org/), vì Django cần điều này để tương tác với cơ sở dữ liệu Postgres.

#### dj-database-url

_dj-database-url_ được sử dụng để trích xuất cấu hình cơ sở dữ liệu Django từ biến môi trường.

Cài đặt nó cục bộ để nó trở thành một phần của [requirements](#requirements) để thiết lập trên máy chủ triển khai:

```bash
pip3 install dj-database-url
```

#### settings.py

Mở **/locallibrary/settings.py** và copy cấu hình sau vào cuối tệp:

```python
# Update database configuration from $DATABASE_URL environment variable (if defined)
import dj_database_url

if 'DATABASE_URL' in os.environ:
    DATABASES['default'] = dj_database_url.config(
        conn_max_age=500,
        conn_health_checks=True,
    )
```

Django bây giờ sẽ sử dụng cấu hình cơ sở dữ liệu trong `DATABASE_URL` nếu biến môi trường được đặt; nếu không, nó sẽ sử dụng cơ sở dữ liệu SQLite mặc định.
Giá trị `conn_max_age=500` làm cho kết nối trở nên liên tục, hiệu quả hơn nhiều so với việc tạo lại kết nối trong mỗi chu kỳ yêu cầu (đây là tùy chọn và có thể xóa nếu cần).

#### psycopg2

<!-- Django 4.2 now supports Psycopg (3) : https://docs.djangoproject.com/en/5.0/releases/4.2/#psycopg-3-support
  But didn't work on Railway!
  Try again to update in next release.
-->

Django cần _psycopg2_ để làm việc với cơ sở dữ liệu Postgres.
Cài đặt nó cục bộ để nó trở thành một phần của [requirements](#requirements) để Railway thiết lập trên máy chủ từ xa:

```bash
pip3 install psycopg2-binary
```

Lưu ý rằng Django sẽ sử dụng cơ sở dữ liệu SQLite trong quá trình phát triển theo mặc định, trừ khi `DATABASE_URL` được đặt.
Bạn có thể chuyển hoàn toàn sang Postgres và sử dụng cùng một cơ sở dữ liệu lưu trữ cho cả phát triển và production bằng cách đặt cùng biến môi trường trong môi trường phát triển của bạn (Railway giúp dễ dàng sử dụng cùng một môi trường cho production và phát triển).
Ngoài ra, bạn cũng có thể cài đặt và sử dụng [cơ sở dữ liệu Postgres tự lưu trữ](https://www.psycopg.org/docs/install.html) trên máy tính cục bộ của bạn.

### Phục vụ các tệp tĩnh trong production

Trong quá trình phát triển, chúng ta sử dụng Django và máy chủ web phát triển Django để phục vụ cả HTML động và tệp tĩnh (CSS, JavaScript, v.v.).
Điều này không hiệu quả cho các tệp tĩnh, vì các yêu cầu phải đi qua Django mặc dù Django không làm gì với chúng.
Mặc dù điều này không quan trọng trong quá trình phát triển, nhưng nó sẽ có tác động đáng kể đến hiệu suất nếu chúng ta sử dụng cùng cách tiếp cận trong production.

Trong môi trường production, chúng ta thường tách các tệp tĩnh khỏi ứng dụng web Django, giúp phục vụ chúng trực tiếp từ máy chủ web hoặc từ mạng phân phối nội dung (CDN) dễ dàng hơn.

Các biến cài đặt quan trọng là:

- `STATIC_URL`: Đây là vị trí URL cơ sở mà từ đó các tệp tĩnh sẽ được phục vụ, ví dụ trên CDN.
- `STATIC_ROOT`: Đây là đường dẫn tuyệt đối đến một thư mục nơi công cụ _collectstatic_ của Django sẽ thu thập bất kỳ tệp tĩnh nào được tham chiếu trong các mẫu của chúng ta. Sau khi được thu thập, chúng có thể được tải lên như một nhóm đến bất cứ nơi nào các tệp sẽ được lưu trữ.
- `STATICFILES_DIRS`: Đây liệt kê các thư mục bổ sung mà công cụ _collectstatic_ của Django nên tìm kiếm tệp tĩnh.

Các mẫu Django tham chiếu vị trí tệp tĩnh tương đối với thẻ `static` (bạn có thể thấy điều này trong mẫu cơ sở được định nghĩa trong [Django Tutorial Part 5: Creating our home page](/en-US/docs/Learn_web_development/Extensions/Server-side/Django/Home_page#the_locallibrary_base_template)), mà lần lượt ánh xạ đến cài đặt `STATIC_URL`.
Do đó, các tệp tĩnh có thể được tải lên bất kỳ máy chủ nào và bạn có thể cập nhật ứng dụng của mình để tìm chúng bằng cài đặt này.

Công cụ _collectstatic_ được sử dụng để thu thập các tệp tĩnh vào thư mục được định nghĩa bởi cài đặt dự án `STATIC_ROOT`.
Nó được gọi bằng lệnh sau:

```bash
python3 manage.py collectstatic
```

Đối với hướng dẫn này, _collectstatic_ có thể được chạy trước khi ứng dụng được tải lên, sao chép tất cả các tệp tĩnh trong ứng dụng vào vị trí được chỉ định trong `STATIC_ROOT`.
`Whitenoise` sau đó tìm các tệp từ vị trí được định nghĩa bởi `STATIC_ROOT` (theo mặc định) và phục vụ chúng tại URL cơ sở được định nghĩa bởi `STATIC_URL`.

#### settings.py

Mở **/locallibrary/settings.py** và copy cấu hình sau vào cuối tệp.
`BASE_DIR` phải đã được định nghĩa trong tệp của bạn (`STATIC_URL` có thể đã được định nghĩa trong tệp khi nó được tạo.
Mặc dù sẽ không gây hại gì, bạn cũng có thể xóa tham chiếu trùng lặp trước đó).

```python
# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/5.0/howto/static-files/

# The absolute path to the directory where collectstatic will collect static files for deployment.
STATIC_ROOT = BASE_DIR / 'staticfiles'

# The URL to use when referring to static files (where they will be served from)
STATIC_URL = '/static/'
```

Chúng ta sẽ thực sự phục vụ tệp bằng cách sử dụng thư viện gọi là [WhiteNoise](https://pypi.org/project/whitenoise/), mà chúng ta cài đặt và cấu hình trong phần tiếp theo.

### Whitenoise

Có nhiều cách để phục vụ các tệp tĩnh trong production (chúng ta đã thấy các cài đặt Django liên quan trong các phần trước).
Dự án [WhiteNoise](https://pypi.org/project/whitenoise/) cung cấp một trong những phương pháp đơn giản nhất để phục vụ tài sản tĩnh trực tiếp từ Gunicorn trong production.

Hãy xem [WhiteNoise](https://pypi.org/project/whitenoise/) để biết giải thích về cách thức hoạt động và lý do tại sao việc triển khai là phương pháp tương đối hiệu quả để phục vụ các tệp này.

Các bước để thiết lập _WhiteNoise_ để sử dụng với dự án [được đưa ra ở đây](https://whitenoise.readthedocs.io/en/stable/django.html) (và được sao chép bên dưới):

#### Cài đặt whitenoise

Cài đặt whitenoise cục bộ bằng lệnh sau:

```bash
pip3 install whitenoise
```

#### settings.py

Để cài đặt _WhiteNoise_ vào ứng dụng Django của bạn, mở **/locallibrary/settings.py**, tìm cài đặt `MIDDLEWARE` và thêm `WhiteNoiseMiddleware` gần đầu danh sách, ngay bên dưới `SecurityMiddleware`:

```python
MIDDLEWARE = [
    'django.middleware.security.SecurityMiddleware',
    'whitenoise.middleware.WhiteNoiseMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
]
```

Tùy chọn, bạn có thể giảm kích thước của các tệp tĩnh khi chúng được phục vụ (điều này hiệu quả hơn).
Chỉ cần thêm phần sau vào cuối **/locallibrary/settings.py**:

```python
# Static file serving.
# https://whitenoise.readthedocs.io/en/stable/django.html#add-compression-and-caching-support
STORAGES = {
    # ...
    "staticfiles": {
        "BACKEND": "whitenoise.storage.CompressedManifestStaticFilesStorage",
    },
}
```

Bạn không cần làm gì khác để cấu hình _WhiteNoise_ vì nó sử dụng cài đặt dự án của bạn cho `STATIC_ROOT` và `STATIC_URL` theo mặc định.

### Requirements

Các yêu cầu Python của ứng dụng web của bạn nên được lưu trữ trong tệp **requirements.txt** ở thư mục gốc của kho lưu trữ của bạn.
Nhiều dịch vụ lưu trữ sẽ tự động cài đặt các phụ thuộc trong tệp này (trong các dịch vụ khác bạn phải tự làm điều này).
Bạn có thể tạo tệp này bằng _pip_ trên dòng lệnh (chạy lệnh sau trong thư mục gốc repo):

```bash
pip3 freeze > requirements.txt
```

Sau khi cài đặt tất cả các phụ thuộc khác nhau ở trên, tệp **requirements.txt** của bạn nên có _ít nhất_ các mục này được liệt kê (mặc dù số phiên bản có thể khác).
Hãy xóa bất kỳ phụ thuộc nào khác không được liệt kê bên dưới, trừ khi bạn đã thêm chúng một cách rõ ràng cho ứng dụng này.

```plain
Django==5.0.2
dj-database-url==2.1.0
gunicorn==21.2.0
psycopg2-binary==2.9.9
wheel==0.38.1
whitenoise==6.6.0
python-dotenv==1.0.1
```

### Cập nhật kho lưu trữ ứng dụng của bạn trên GitHub

Nhiều dịch vụ lưu trữ cho phép bạn nhập và/hoặc đồng bộ hóa các dự án từ kho lưu trữ cục bộ hoặc từ các nền tảng kiểm soát phiên bản nguồn dựa trên đám mây.
Điều này có thể làm cho việc triển khai và phát triển lặp đi lặp lại dễ dàng hơn nhiều.

Bạn nên đã sử dụng GitHub để lưu trữ mã nguồn local library (điều này được thiết lập trong [Source code management with Git and GitHub](/en-US/docs/Learn_web_development/Extensions/Server-side/Django/development_environment#source_code_management_with_git_and_github) như một phần của thiết lập môi trường phát triển của bạn.

Đây là điểm tốt để sao lưu dự án "vanilla" của bạn — trong khi một số thay đổi chúng ta sẽ thực hiện trong các phần sau có thể hữu ích cho việc triển khai trên bất kỳ dịch vụ lưu trữ nào (hoặc để phát triển), những thay đổi khác có thể không.
Giả sử bạn đã sao lưu tất cả các thay đổi đã thực hiện cho đến nay vào nhánh `main` trên GitHub, bạn có thể tạo một nhánh mới để sao lưu các thay đổi của mình như được hiển thị:

```bash
# Fetch the latest main branch
git checkout main
git pull origin main

# Create branch vanilla_deployment from the current branch (main)
git checkout -b vanilla_deployment

# Push the new branch to GitHub
git push origin vanilla_deployment

# Switch back to main
git checkout main

# Make any further changes in a new branch
git checkout -b my_changes_for_deployment # Create a new branch
```

## Ví dụ: Lưu trữ trên PythonAnywhere

Phần này cung cấp minh họa thực tế về cách lưu trữ _LocalLibrary_ trên [PythonAnywhere](https://www.pythonanywhere.com/).

### Tại sao chọn PythonAnywhere?

Chúng ta chọn sử dụng PythonAnywhere vì một số lý do:

- PythonAnywhere có [gói beginner miễn phí](https://www.pythonanywhere.com/pricing/) là _thực sự_ miễn phí, mặc dù có một số giới hạn.
  Thực tế là nó phù hợp với tất cả các nhà phát triển thực sự quan trọng với MDN!

  > [!NOTE]
  > Hướng dẫn này đã được lưu trữ trên Heroku, Railway, và bây giờ PythonAnywhere, chuyển đổi khi các gói miễn phí trước đó bị ngừng.
  > Chúng ta đã chọn PythonAnywhere vì chúng ta nghĩ rằng gói này có thể sẽ vẫn miễn phí.
  > Chúng ta cũng giữ ví dụ Railway, không miễn phí, để so sánh, và vì nó cho phép chúng ta dễ dàng hơn để trình bày các tính năng như tích hợp với cơ sở dữ liệu Postgres chạy trên một dịch vụ khác.

- PythonAnywhere đảm nhận cơ sở hạ tầng để bạn không phải lo lắng.
  Không phải lo lắng về máy chủ, cân bằng tải, reverse proxy, v.v., giúp bắt đầu dễ dàng hơn nhiều.
- Các kỹ năng và khái niệm bạn sẽ học khi sử dụng PythonAnywhere có thể chuyển giao được.
- Các giới hạn dịch vụ và gói không đặc biệt ảnh hưởng đến chúng ta khi sử dụng PythonAnywhere cho hướng dẫn.
  Ví dụ:
  - Gói beginner cho phép một ứng dụng web tại `<your-username>.pythonanywhere.com`, hạn chế truy cập Internet ra ngoài từ các ứng dụng của bạn, CPU/băng thông thấp, không hỗ trợ notebook IPython/Jupyter, không có cơ sở dữ liệu Postgres miễn phí.
    Nhưng có đủ không gian để trang web cơ bản của chúng ta chạy!
  - Các tên miền tùy chỉnh không được hỗ trợ (tại thời điểm viết bài này).
  - Môi trường tắt khi không được sử dụng, vì vậy có thể khởi động lại chậm.
    Bạn có thể chạy mãi mãi, nhưng bạn sẽ cần truy cập trang web mỗi ba tháng và gia hạn ứng dụng web.
  - Có hỗ trợ miễn phí cho cơ sở dữ liệu MySQL riêng, nhưng không phải Postgres.
    Trong minh họa này chúng ta chỉ sử dụng cơ sở dữ liệu SQLite Django mặc định.

PythonAnywhere phù hợp để lưu trữ minh họa này và có thể được mở rộng cho các dự án lớn hơn nếu cần.
Bạn nên dành thời gian để xác định xem nó có [phù hợp với trang web của riêng bạn](#chon-nha-cung-cap-luu-tru) không.

### PythonAnywhere hoạt động như thế nào?

PythonAnywhere cung cấp giao diện hoàn toàn dựa trên web để tải lên, chỉnh sửa và làm việc với ứng dụng của bạn.

Thông qua giao diện, bạn có thể khởi chạy một bash console trong môi trường Linux Ubuntu, nơi bạn có thể tạo ứng dụng của mình.
Trong minh họa này, chúng ta sẽ sử dụng console để sao chép kho lưu trữ GitHub của thư viện cục bộ, và tạo môi trường Python để chạy ứng dụng web.

Gói miễn phí không cung cấp hỗ trợ Postgres riêng.
Mặc dù chúng ta có thể sử dụng một số dịch vụ lưu trữ khác cho cơ sở dữ liệu của mình, chúng ta chỉ sử dụng cơ sở dữ liệu SQLite mặc định do Django tạo trong môi trường Ubuntu lưu trữ (có đủ không gian để minh họa chức năng thư viện).

Sau khi ứng dụng chạy, nó có thể được cấu hình cho production bằng cách đặt các biến môi trường thông qua bash console.

Đó là tất cả tổng quan bạn cần để bắt đầu.

### Tạo tài khoản PythonAnywhere

Để bắt đầu sử dụng PythonAnywhere, trước tiên bạn cần tạo tài khoản:

- Vào trang [Plans and pricing](https://www.pythonanywhere.com/pricing/) của PythonAnywhere, và chọn nút **Create a Beginner account**.
- Tạo tài khoản với tên người dùng, email và mật khẩu, chấp nhận các điều khoản và điều kiện, sau đó chọn **Register**.
- Sau đó bạn sẽ được đăng nhập và chuyển hướng đến bảng điều khiển PythonAnywhere: `https://www.pythonanywhere.com/user/<your_user_name>/`.

### Cài đặt thư viện từ GitHub

Tiếp theo, chúng ta sẽ mở bash prompt, thiết lập môi trường ảo, và tải mã nguồn thư viện cục bộ từ GitHub.
Chúng ta cũng sẽ cấu hình cơ sở dữ liệu mặc định và thu thập các tệp tĩnh để chúng có thể được phục vụ bởi PythonAnywhere.

1. Đầu tiên mở màn hình quản lý Console bằng cách chọn **Consoles** trong thanh ứng dụng trên cùng.
2. Sau đó chọn liên kết **Bash** để tạo và khởi chạy console mới:

   ![Image of PythonAnywhere Console management screen](python_anywhere_start_bash_console.png)

   Lưu ý rằng bất kỳ console nào bạn tạo được lưu để tái sử dụng sau này, cùng với toàn bộ lịch sử của nó.
   Mũi tên xanh ở trên cho thấy tài khoản này có một console mà chúng ta có thể đã mở thay thế.

3. Trong console, nhập lệnh sau để tạo môi trường ảo Python 3.10 có tên "env_local_library" để cài đặt các phụ thuộc của thư viện cục bộ.

   ```bash
   mkvirtualenv --python=python3.10 env_local_library
   ```

   Đây chính xác là quy trình tương tự như được đề cập trong [Setting up a Django development environment](/en-US/docs/Learn_web_development/Extensions/Server-side/Django/development_environment).
   Chúng ta có thể đặt tên cho môi trường bất kỳ tên gì, và chúng ta có thể hủy kích hoạt và kích hoạt lại nó bằng các lệnh bên dưới:

   ```bash
   deactivate
   workon env_local_library
   ```

4. Tiếp theo tải mã nguồn thư viện từ GitHub.
   PythonAnywhere yêu cầu bạn cài đặt ứng dụng trong thư mục có tên theo URL trang web của bạn.

   > [!NOTE]
   > Vì chúng ta đang sử dụng tài khoản miễn phí, bạn chỉ có thể đặt tên tài khoản của mình là `<your_pythonanywhere_username>.pythonanywhere.com` (ví dụ: nếu tên người dùng của bạn là "Odtsetseg", bạn sẽ phải đặt mã nguồn thư viện cục bộ vào thư mục có tên `odtsetseg.pythonanywhere.com`).

   Nhập lệnh sau để sao chép mã nguồn thư viện của bạn vào thư mục được đặt tên phù hợp (bạn sẽ cần thay thế các giá trị tên người dùng bằng tên của bạn):

   ```bash
   git clone https://github.com/<github_username>/django-locallibrary-tutorial.git <your_pythonanywhere_username>.pythonanywhere.com

   # Navigate into the new folder
   cd <your_pythonanywhere_username>.pythonanywhere.com
   ```

5. Cài đặt các phụ thuộc thư viện bằng tệp `requirements.txt`:

   ```bash
   pip3 install -r requirements.txt
   ```

6. Tạo và cấu hình cơ sở dữ liệu SQLite trên máy tính lưu trữ (giống như chúng ta đã làm trong quá trình phát triển).

   ```bash
   python manage.py migrate
   ```

   > [!NOTE]
   > Đối với ví dụ Railway, chúng ta sẽ [Cấu hình cơ sở dữ liệu Postgres](#provision_and_connect_a_postgres_sql_database), và kết nối với nó bằng cách đặt biến môi trường `DATABASE_URL`.
   > Điều quan trọng là `migrate` được gọi _sau_ khi cấu hình cơ sở dữ liệu nào sẽ được sử dụng.

7. Thu thập tất cả các tệp tĩnh vào một vị trí nơi chúng có thể được [phục vụ trong production](#phuc-vu-cac-tep-tinh-trong-production):

   ```bash
   python manage.py collectstatic --no-input
   ```

8. Tạo superuser để truy cập trang web (như đã đề cập trong phần [Django admin site](/en-US/docs/Learn_web_development/Extensions/Server-side/Django/Admin_site#creating_a_superuser)):

   ```bash
   python manage.py createsuperuser
   ```

   Ghi lại thông tin chi tiết, vì bạn sẽ cần chúng để kiểm thử trang web của mình.

### Thiết lập ứng dụng web

Sau khi lấy mã nguồn thư viện cục bộ và cài đặt các phụ thuộc trong môi trường ảo, chúng ta cần nói với PythonAnywhere cách tìm và sử dụng chúng như một ứng dụng web.

1. Điều hướng đến phần _Web_ của trang web và chọn liên kết **Add a new web app**:

   ![PythonAnywhere "Web" section showing button for adding a new app](python_anywhere_web_add_new_app.png)

   Trình hướng dẫn _Create new web app_ sẽ mở ra để hướng dẫn bạn qua việc cấu hình các thuộc tính chính của ứng dụng web.

2. Chọn **Next** để bỏ qua cấu hình tên miền ứng dụng web.
   Tài khoản miễn phí sẽ tạo tên miền dựa trên tên người dùng của bạn: `<user_name>.pythonanywhere.com`.

   ![PythonAnywhere prompt for setting the domain name of new web app](python_anywhere_web_add_new_app_prompt.png)

3. Trong màn hình _Select a Python Web framework_ chọn **Manual configuration**.

   ![PythonAnywhere prompt for selecting web framework used for the application](python_anywhere_web_add_select_framework_manual.png)

   Cấu hình thủ công cho chúng ta toàn quyền kiểm soát cách môi trường được cấu hình.
   Điều này không quan trọng lắm bây giờ, nhưng sẽ quan trọng nếu chúng ta lưu trữ nhiều trang web, có thể với các phiên bản Python và/hoặc Django khác nhau.

4. Trong màn hình _Select a Python version_ chọn **3.10**

   ![PythonAnywhere prompt for selecting Python version for Web application](python_anywhere_web_add_select_python_version.png)

   Nhìn chung, bạn nên chọn phiên bản Python mới nhất được cho phép bởi phiên bản Django bạn đang sử dụng.

5. Trong màn hình _Manual configuration_ chọn **Next** (màn hình chỉ giải thích một số tùy chọn cấu hình)

   ![PythonAnywhere prompt explaining next configuration options](python_anywhere_web_add_manual_config.png)

   Ứng dụng web được tạo và hiển thị trong phần Web như được hiển thị.
   Màn hình có nút **Reload** mà bạn có thể sử dụng để tải lại ứng dụng web sau khi bạn thực hiện bất kỳ thay đổi nào.
   Như đã ghi chú trên màn hình, bạn sẽ cần nhấp vào nút **Run until 3 months from today** để giữ cho trang web hoạt động thêm ba tháng (và tiếp tục).

   ![PythonAnywhere Configured Web app](python_anywhere_web_configuration.png)

6. Cuộn xuống phần "Code" của tab _Web_ và chọn liên kết đến tệp cấu hình WSGI.
   Tệp này sẽ có tên theo dạng `/var/www/<user_name>_pythonanywhere_com_wsgi.py`.

   ![PythonAnywhere WSGI file in Web tab, code section](python_anywhere_web_code_wsgi_select.png)

   Thay thế nội dung trong tệp bằng văn bản sau (đầu tiên cập nhật "hamishwillee" bằng tên người dùng của bạn), sau đó chọn nút **Save**.

   ```python
   import os
   import sys

   path = '/home/hamishwillee/hamishwillee.pythonanywhere.com'
   if path not in sys.path:
       sys.path.append(path)

   os.environ['DJANGO_SETTINGS_MODULE'] = 'locallibrary.settings'

   from django.core.wsgi import get_wsgi_application
   application = get_wsgi_application()
   ```

   Lưu ý rằng vai trò của tệp WSGI là giúp máy chủ Gunicorn tìm thấy ứng dụng thư viện cục bộ.
   PythonAnywhere yêu cầu tệp này ở vị trí này, đó là lý do tại sao tệp WSGI đã có trong dự án không thể được sử dụng.

7. Cuộn xuống phần "Virtualenv" của tab _Web_.
   Chọn liên kết **Enter the path to a virtual env, if desired** và nhập đường dẫn của môi trường ảo được tạo trong phần trước.
   Nếu bạn đặt tên nó là "env_local_library" như được đề xuất, đường dẫn sẽ là: `/home/<user_name>/.virtualenvs/env_local_library`

   ![PythonAnywhere Virtual env section of Web tab](python_anywhere_web_virtualenv.png)

8. Cuộn xuống phần "Static files" của tab _Web_.

   ![PythonAnywhere Static files section of Web tab](python_anywhere_web_static_files.png)

   Chọn liên kết **Enter URL** và nhập `\static_files\`.
   Đây là `STATIC_URL` trong [cài đặt ứng dụng](#settings.py_2), và phản ánh vị trí nơi các tệp được sao chép khi chúng ta chạy `collectstatic` trong phần trước.

9. Gần đầu tab _Web_, chọn nút **Reload** để khởi động lại trang web.
   Sau đó chọn liên kết URL trang web để khởi chạy trang web trực tiếp:

![PythonAnywhere Web screen with the link to launch the site highlighted](python_anywhere_web_open_site.png)

### Đặt ALLOWED_HOSTS và CSRF_TRUSTED_ORIGINS

Khi trang web được mở, ở thời điểm này bạn sẽ thấy một màn hình lỗi debug như được hiển thị bên dưới.
Đây là lỗi bảo mật Django được đưa ra vì mã nguồn của chúng ta không đang chạy trên "allowed host".

![A detailed error page with a full traceback of an invalid HTTP_HOST header](python_anywhere_error_disallowed_host.png)

> [!NOTE]
> Loại thông tin debug này rất hữu ích khi bạn đang thiết lập, nhưng là rủi ro bảo mật trong một trang web đã triển khai.
> Trong phần tiếp theo, chúng ta sẽ chỉ cho bạn cách vô hiệu hóa mức ghi nhật ký này trên trang web trực tiếp bằng cách sử dụng [biến môi trường](#su-dung-bien-moi-truong-tren-pythonanywhere).

Mở **/locallibrary/settings.py** trong dự án GitHub của bạn và thay đổi cài đặt [ALLOWED_HOSTS](https://docs.djangoproject.com/en/5.0/ref/settings/#allowed-hosts) để bao gồm URL trang web PythonAnywhere của bạn:

```python
## For example, for a site URL at 'hamishwillee.pythonanywhere.com'
## (replace the string below with your own site URL):
ALLOWED_HOSTS = ['hamishwillee.pythonanywhere.com', '127.0.0.1']

# During development, you can instead set just the base URL
# (you might decide to change the site a few times).
# ALLOWED_HOSTS = ['.pythonanywhere.com','127.0.0.1']
```

Vì ứng dụng sử dụng bảo vệ CSRF, bạn cũng cần đặt khóa [CSRF_TRUSTED_ORIGINS](https://docs.djangoproject.com/en/5.0/ref/settings/#csrf-trusted-origins).
Mở **/locallibrary/settings.py** và thêm dòng như bên dưới:

```python
## For example, for a site URL is at 'web-production-3640.up.railway.app'
## (replace the string below with your own site URL):
CSRF_TRUSTED_ORIGINS = ['https://hamishwillee.pythonanywhere.com']

# During development/for this tutorial you can instead set just the base URL
# CSRF_TRUSTED_ORIGINS = ['https://*.pythonanywhere.com']
```

Lưu các cài đặt này và commit chúng vào kho lưu trữ GitHub của bạn.

Sau đó bạn sẽ cần cập nhật phiên bản dự án của mình trên PythonAnywhere.
Giả sử bạn đang sử dụng bash prompt trong thư mục `<user_name>.pythonanywhere.com`, và bạn đã push các thay đổi lên nhánh main, sau đó bạn có thể import chúng trong bash prompt bằng lệnh:

```bash
git pull origin main
```

Sử dụng nút **Restart** trên tab `Web` để khởi động lại ứng dụng.
Nếu bạn làm mới trang web lưu trữ, bây giờ nó sẽ mở và hiển thị trang chủ của trang web.

Bạn sẽ có thể đăng nhập bằng tài khoản superuser bạn đã tạo ở trên, và tạo tác giả, thể loại, sách, v.v., giống như bạn đã làm trên máy tính cục bộ của mình.

### Sử dụng biến môi trường trên PythonAnywhere

Trong phần về [Chuẩn bị trang web để xuất bản](#chuan-bi-trang-web-de-xuat-ban), chúng ta đã sửa đổi ứng dụng để nó có thể được cấu hình bằng biến môi trường hoặc biến trong tệp **.env** trong production.

Cụ thể, chúng ta thiết lập thư viện để bạn có thể đặt:

- `DJANGO_DEBUG=False` để giảm thông tin debug trace được hiển thị cho người dùng khi có lỗi.
- `DJANGO_SECRET_KEY` thành một giá trị bí mật trong production.
- `DATABASE_URL` nếu ứng dụng của bạn sử dụng cơ sở dữ liệu lưu trữ (chúng ta không làm trong ví dụ này).

Cách thức đặt biến môi trường phụ thuộc vào dịch vụ lưu trữ.
Đối với PythonAnywhere, bạn cần đọc chúng từ một tệp môi trường.
Chúng ta đã thiết lập cho điều đó, vì vậy tất cả những gì chúng ta cần làm là tạo tệp.

Các bước là:

1. Mở bash prompt PythonAnywhere.
2. Điều hướng đến thư mục ứng dụng của bạn (thay `<user-name>` bằng tài khoản của bạn):

   ```bash
   cd ~/<user-name>.pythonanywhere.com
   ```

3. Đặt các biến môi trường bằng cách ghi chúng như các cặp khóa-giá trị vào tệp `.env`.
   Ví dụ: để đặt `DJANGO_DEBUG` thành `False` trong bash console, nhập lệnh sau:

   ```bash
   echo "DJANGO_DEBUG=False" >> .env
   ```

4. Khởi động lại ứng dụng.

Bạn có thể kiểm tra rằng thao tác đã hoạt động bằng cách cố gắng mở một bản ghi không tồn tại (ví dụ: tạo một thể loại, sau đó tăng số trong thanh URL để mở một bản ghi chưa được tạo).
Nếu biến môi trường đã được tải, bạn sẽ nhận được thông báo "Not found" thay vì thông tin debug trace chi tiết.

## Ví dụ: Lưu trữ trên Railway

Phần này cung cấp minh họa thực tế về cách cài đặt _LocalLibrary_ trên [Railway](https://railway.com/).

### Tại sao chọn Railway?

> [!WARNING]
> Railway không còn có bậc starter hoàn toàn miễn phí nữa.
> Chúng ta đã giữ các hướng dẫn này vì Railway có một số tính năng tuyệt vời, và sẽ là lựa chọn tốt hơn cho một số người dùng.

Railway là lựa chọn lưu trữ hấp dẫn vì một số lý do:

- Railway đảm nhận hầu hết cơ sở hạ tầng để bạn không phải lo lắng.
  Không phải lo lắng về máy chủ, cân bằng tải, reverse proxy, v.v., giúp bắt đầu dễ dàng hơn nhiều.
- Railway có [trọng tâm về trải nghiệm nhà phát triển cho phát triển và triển khai](https://docs.railway.com/platform/compare-to-heroku), dẫn đến đường cong học tập nhanh hơn và nhẹ nhàng hơn so với nhiều lựa chọn thay thế khác.
- Các kỹ năng và khái niệm bạn sẽ học khi sử dụng Railway có thể chuyển giao được.
  Mặc dù Railway có một số tính năng mới tuyệt vời, các dịch vụ lưu trữ phổ biến khác sử dụng nhiều ý tưởng và cách tiếp cận tương tự.
- [Tài liệu Railway](https://docs.railway.com/) rõ ràng và đầy đủ.
- Dịch vụ có vẻ rất đáng tin cậy, và nếu bạn thích nó, giá là có thể dự đoán được, và việc mở rộng ứng dụng rất dễ dàng.

Bạn nên dành thời gian để xác định xem Railway có [phù hợp với trang web của riêng bạn](#chon-nha-cung-cap-luu-tru) không.

### Railway hoạt động như thế nào?

Các ứng dụng web mỗi cái chạy trong container ảo hóa riêng biệt và độc lập của nó.
Để thực thi ứng dụng của bạn, Railway cần có khả năng thiết lập môi trường và phụ thuộc phù hợp, và cũng hiểu cách khởi chạy nó.
Đối với ứng dụng Django, chúng ta cung cấp thông tin này trong một số tệp văn bản:

- **runtime.txt**: nêu ngôn ngữ lập trình và phiên bản cần sử dụng.
- **requirements.txt**: liệt kê các phụ thuộc Python cần thiết cho trang web của bạn, bao gồm Django.
- **Procfile**: Danh sách các quy trình cần thực thi để khởi động ứng dụng web.
  Đối với Django, đây thường là máy chủ ứng dụng web Gunicorn (với script `.wsgi`).
- **wsgi.py**: Cấu hình [WSGI](https://wsgi.readthedocs.io/en/latest/what.html) để gọi ứng dụng Django của chúng ta trong môi trường Railway.

Sau khi ứng dụng đang chạy, nó có thể tự cấu hình bằng thông tin được cung cấp trong [biến môi trường](https://docs.railway.com/variables).
Ví dụ: ứng dụng sử dụng cơ sở dữ liệu có thể lấy địa chỉ bằng biến `DATABASE_URL`.
Bản thân dịch vụ cơ sở dữ liệu có thể được lưu trữ bởi Railway hoặc một số nhà cung cấp khác.

Các nhà phát triển tương tác với Railway thông qua trang web Railway, và sử dụng công cụ [Command Line Interface (CLI)](https://docs.railway.com/cli) đặc biệt.
CLI cho phép bạn liên kết kho lưu trữ GitHub cục bộ với một dự án railway, tải lên kho lưu trữ từ nhánh cục bộ lên trang web trực tiếp, kiểm tra nhật ký của quy trình đang chạy, đặt và lấy biến cấu hình và nhiều hơn nữa.
Một trong những tính năng hữu ích nhất là bạn có thể sử dụng CLI để chạy dự án cục bộ của mình với các biến môi trường giống như dự án trực tiếp.

Để ứng dụng của chúng ta hoạt động trên Railway, chúng ta cần đưa ứng dụng web Django của mình vào kho lưu trữ git, thêm các tệp trên, tích hợp với cơ sở dữ liệu add-on, và thực hiện các thay đổi để xử lý các tệp tĩnh đúng cách.
Sau khi chúng ta đã làm tất cả điều đó, chúng ta có thể thiết lập tài khoản Railway, lấy client Railway và cài đặt trang web của chúng ta.

Đó là tất cả tổng quan bạn cần để bắt đầu.

### Cập nhật ứng dụng cho Railway

Phần này giải thích các thay đổi bạn cần thực hiện đối với ứng dụng _LocalLibrary_ để nó hoạt động trên Railway.
Thực sự chúng ta chỉ phải tạo một tệp `Procfile` và `runtime.txt`, vì hầu hết mọi thứ khác đã có sẵn.

Lưu ý rằng các thay đổi này sẽ không ngăn bạn sử dụng quy trình kiểm thử và làm việc cục bộ mà chúng ta đã học.

#### Procfile

_Procfile_ là "entry point" của ứng dụng web.
Nó liệt kê các lệnh sẽ được thực thi bởi Railway để khởi động trang web của bạn.

Tạo tệp `Procfile` (không có phần mở rộng tệp) trong thư mục gốc của kho lưu trữ GitHub của bạn và copy/paste văn bản sau:

```plain
web: python manage.py migrate && python manage.py collectstatic --no-input && gunicorn locallibrary.wsgi
```

Tiền tố `web:` nói với Railway rằng đây là quy trình web và có thể nhận lưu lượng HTTP.
Sau đó chúng ta gọi lệnh di chuyển Django `python manage.py migrate` để thiết lập các bảng cơ sở dữ liệu.
Tiếp theo, chúng ta gọi lệnh Django `python manage.py collectstatic` để thu thập các tệp tĩnh vào thư mục được định nghĩa bởi cài đặt dự án `STATIC_ROOT` (xem phần [phục vụ các tệp tĩnh trong production](#phuc-vu-cac-tep-tinh-trong-production) bên dưới).
Cuối cùng, chúng ta khởi động quy trình _gunicorn_, một máy chủ ứng dụng web phổ biến, truyền cho nó thông tin cấu hình trong module `locallibrary.wsgi` (được tạo với khung ứng dụng của chúng ta: **/locallibrary/wsgi.py**).

Bạn sẽ nhận thấy rằng chúng ta đã thiết lập dự án để bao gồm _gunicorn_ và hỗ trợ phục vụ các tệp tĩnh!

Bạn cũng có thể sử dụng Procfile để khởi động các quy trình worker hoặc để chạy các tác vụ không tương tác khác trước khi bản phát hành được triển khai.

#### Runtime

Tệp **runtime.txt**, nếu được định nghĩa, nói với Railway phiên bản Python nào sẽ sử dụng.
Tạo tệp trong thư mục gốc của repo và thêm văn bản sau:

```plain
python-3.10.2
```

> [!NOTE]
> Các nhà cung cấp lưu trữ không nhất thiết hỗ trợ mọi phiên bản Python runtime nhỏ.
> Họ thường sẽ sử dụng phiên bản được hỗ trợ gần nhất với giá trị bạn chỉ định.

#### Kiểm thử lại và lưu các thay đổi lên GitHub

Trước khi tiến hành, đầu tiên kiểm thử lại trang web cục bộ và đảm bảo rằng nó không bị hỏng bởi bất kỳ thay đổi nào ở trên.
Chạy máy chủ web phát triển như thường lệ và sau đó kiểm tra rằng trang web vẫn hoạt động như bạn mong đợi trên trình duyệt.

```bash
python3 manage.py runserver
```

Tiếp theo, hãy `push` các thay đổi lên GitHub.
Trong terminal (sau khi đã điều hướng đến kho lưu trữ cục bộ của chúng ta), nhập các lệnh sau:

```python
git checkout -b railway_changes
git add -A
git commit -m "Added files and changes required for deployment"
git push origin railway_changes
```

Sau đó tạo và merge PR trên GitHub.

Bây giờ chúng ta đã sẵn sàng bắt đầu triển khai LocalLibrary trên Railway.

### Tạo tài khoản Railway

Để bắt đầu sử dụng Railway, trước tiên bạn cần tạo tài khoản:

- Vào [railway.com](https://railway.com/) và nhấp vào liên kết **Login** trong thanh công cụ trên cùng.
- Chọn GitHub trong cửa sổ bật lên để đăng nhập bằng thông tin đăng nhập GitHub của bạn
- Sau đó bạn có thể cần vào email và xác minh tài khoản của mình.
- Sau đó bạn sẽ được đăng nhập vào bảng điều khiển Railway.com: <https://railway.com/dashboard>.

### Triển khai trên Railway từ GitHub

Tiếp theo chúng ta sẽ thiết lập Railway để triển khai thư viện của chúng ta từ GitHub.
Đầu tiên chọn tùy chọn **Dashboard** từ menu trên cùng của trang, sau đó chọn nút **New Project**:

![Railway website dashboard with new project button](railway_new_project_button.png)

Railway sẽ hiển thị danh sách các tùy chọn cho dự án mới, bao gồm tùy chọn triển khai dự án từ mẫu được tạo đầu tiên trong tài khoản GitHub của bạn, và một số cơ sở dữ liệu.
Chọn **Deploy from GitHub repo**.

![Railway website screen - deploy](railway_new_project_button_deploy_github_repo.png)

Tất cả các dự án trong các repo GitHub bạn đã chia sẻ với Railway trong quá trình thiết lập được hiển thị.
Chọn kho lưu trữ GitHub của bạn cho thư viện cục bộ: `<user-name>/django-locallibrary-tutorial`.

![Railway website screen showing a dialog to choose an existing GitHub repository or choose a new one](railway_new_project_button_deploy_github_selectrepo.png)

Xác nhận triển khai của bạn bằng cách chọn **Deploy Now**.

![Confirmation screen - select deploy](railway_new_project_deploy_confirm.png)

Railway sau đó sẽ tải và triển khai dự án của bạn, hiển thị tiến trình trên tab deployments.
Khi triển khai hoàn thành thành công, bạn sẽ thấy màn hình như bên dưới.

![Railway website screen - deployment](railway_project_deploy.png)

Bạn có thể nhấp vào URL trang web (được đánh dấu ở trên) để mở trang web trong trình duyệt (nó vẫn sẽ không hoạt động vì thiết lập chưa hoàn thành).

### Đặt ALLOWED_HOSTS và CSRF_TRUSTED_ORIGINS

Khi trang web được mở, ở thời điểm này bạn sẽ thấy màn hình lỗi debug như được hiển thị bên dưới.
Đây là lỗi bảo mật Django được đưa ra vì mã nguồn của chúng ta không đang chạy trên "allowed host".

![A detailed error page with a full traceback of an invalid HTTP_HOST header](site_error_disallowed_host.png)

> [!NOTE]
> Loại thông tin debug này rất hữu ích khi bạn đang thiết lập, nhưng là rủi ro bảo mật trong một trang web đã triển khai.
> Chúng ta sẽ chỉ cho bạn cách vô hiệu hóa nó sau khi trang web đã hoạt động.

Mở **/locallibrary/settings.py** trong dự án GitHub của bạn và thay đổi cài đặt [ALLOWED_HOSTS](https://docs.djangoproject.com/en/5.0/ref/settings/#allowed-hosts) để bao gồm URL trang web Railway của bạn:

```python
## For example, for a site URL at 'web-production-3640.up.railway.app'
## (replace the string below with your own site URL):
ALLOWED_HOSTS = ['web-production-3640.up.railway.app', '127.0.0.1']

# During development, you can instead set just the base URL
# (you might decide to change the site a few times).
# ALLOWED_HOSTS = ['.railway.com','127.0.0.1']
```

Vì ứng dụng sử dụng bảo vệ CSRF, bạn cũng cần đặt khóa [CSRF_TRUSTED_ORIGINS](https://docs.djangoproject.com/en/5.0/ref/settings/#csrf-trusted-origins).
Mở **/locallibrary/settings.py** và thêm dòng như bên dưới:

```python
## For example, for a site URL is at 'web-production-3640.up.railway.app'
## (replace the string below with your own site URL):
CSRF_TRUSTED_ORIGINS = ['https://web-production-3640.up.railway.app']

# During development/for this tutorial you can instead set just the base URL
# CSRF_TRUSTED_ORIGINS = ['https://*.railway.app']
```

Sau đó lưu cài đặt và commit chúng vào kho lưu trữ GitHub của bạn (Railway sẽ tự động cập nhật và triển khai lại ứng dụng của bạn).

### Cung cấp và kết nối cơ sở dữ liệu Postgres SQL

Tiếp theo chúng ta cần tạo cơ sở dữ liệu Postgres và kết nối nó với ứng dụng Django mà chúng ta vừa triển khai.
(Nếu bạn mở trang web bây giờ, bạn sẽ nhận được lỗi mới vì cơ sở dữ liệu không thể được truy cập).
Chúng ta sẽ tạo cơ sở dữ liệu như một phần của dự án ứng dụng, mặc dù bạn có thể tạo cơ sở dữ liệu trong dự án riêng của nó.

Trên Railway, chọn tùy chọn **Dashboard** từ menu trên cùng của trang và sau đó chọn dự án ứng dụng của bạn.
Ở giai đoạn này, nó chỉ chứa một dịch vụ duy nhất cho ứng dụng của bạn (điều này có thể được chọn để đặt biến và các chi tiết khác của dịch vụ).
Nút **Settings** có thể được chọn để thay đổi cài đặt toàn dự án.
Chọn nút **New**, được sử dụng để thêm dịch vụ vào dự án.

![Railway project with new service button highlighted](railway_project_open_no_database.png)

Chọn **Database** khi được nhắc về loại dịch vụ cần thêm:

![Railway project - select database as new service](railway_project_add_database.png)

Sau đó chọn **Add PostgreSQL** để bắt đầu thêm cơ sở dữ liệu

![Railway project - select Postgres as new service](railway_project_add_database_select_type.png)

Railway sau đó sẽ cung cấp một dịch vụ chứa cơ sở dữ liệu trống trong cùng dự án.
Khi hoàn thành, bạn sẽ thấy cả dịch vụ ứng dụng và cơ sở dữ liệu trong chế độ xem dự án.

![Railway project with application and Postgres database service](railway_project_two_services.png)

Chọn dịch vụ web và sau đó tab _Variables_.
Chọn **New Variable** và sau đó trong hộp _Variable name_, chọn **Add reference**.
Cuộn xuống và chọn `DATABASE_URL` (đây là tên của biến mà chúng ta đã thiết lập locallibrary để đọc như biến môi trường).

![Railway website screen selecting a DATABASE_URL](railway_postgresql_connect.png)

Sau đó chọn **Add** để thêm tham chiếu biến và cuối cùng **Deploy** (điều này sẽ xuất hiện trong cửa sổ bật lên).
Lưu ý rằng bạn cũng có thể đã mở cơ sở dữ liệu Postgres, sau đó tab biến của nó, và sao chép biến qua.

Nếu bạn mở dự án bây giờ, nó sẽ hiển thị giống như khi ở máy tính cục bộ.
Tuy nhiên, lưu ý rằng chưa có cách nào để điền dữ liệu vào thư viện, vì chúng ta chưa tạo tài khoản superuser.
Chúng ta sẽ làm điều đó bằng cách sử dụng công cụ [CLI](https://docs.railway.com/cli) trên máy tính cục bộ của chúng ta.

### Cài đặt client

Tải xuống và cài đặt Railway client cho hệ điều hành cục bộ của bạn bằng cách làm theo [hướng dẫn ở đây](https://docs.railway.com/cli).

Sau khi client được cài đặt, bạn sẽ có thể chạy các lệnh.
Một số thao tác quan trọng hơn bao gồm triển khai thư mục hiện tại của máy tính với dự án Railway liên quan (mà không cần tải lên GitHub), và chạy dự án Django của bạn cục bộ bằng các cài đặt giống như bạn có trên máy chủ production.
Chúng ta sẽ trình bày những điều này trong các phần tiếp theo.

Bạn có thể lấy danh sách tất cả các lệnh có thể bằng cách nhập lệnh sau trong terminal.

```bash
railway help
```

> [!NOTE]
> Trong phần sau, chúng ta sử dụng `railway login` và `railway link` để liên kết dự án hiện tại với thư mục.
> Nếu bạn bị hệ thống đăng xuất, bạn sẽ cần gọi cả hai lệnh lại để liên kết lại dự án.

### Cấu hình superuser

Để tạo superuser, chúng ta cần gọi lệnh Django `createsuperuser` đối với cơ sở dữ liệu production (đây là thao tác tương tự như chúng ta đã chạy cục bộ trong [Django Tutorial Part 4: Django admin site > Creating a superuser](/en-US/docs/Learn_web_development/Extensions/Server-side/Django/Admin_site#creating_a_superuser)).
Railway không cung cấp quyền truy cập terminal trực tiếp vào máy chủ, và chúng ta không thể thêm lệnh này vào [Procfile](#procfile) vì nó tương tác.

Những gì chúng ta có thể làm là gọi lệnh này cục bộ trên dự án Django của chúng ta khi nó được kết nối với cơ sở dữ liệu _production_.
Railway client làm điều này dễ dàng bằng cách cung cấp cơ chế để chạy các lệnh cục bộ bằng cách sử dụng các biến môi trường giống như máy chủ production, bao gồm chuỗi kết nối cơ sở dữ liệu.

Đầu tiên mở một terminal hoặc command prompt trong một bản sao git của dự án locallibrary của bạn.
Sau đó đăng nhập vào tài khoản trình duyệt của bạn bằng lệnh `login` hoặc `login --browserless` (làm theo bất kỳ lời nhắc và hướng dẫn kết quả nào từ client hoặc trang web để hoàn thành đăng nhập):

```bash
railway login
```

Sau khi đăng nhập, liên kết thư mục locallibrary hiện tại của bạn với dự án Railway liên quan bằng lệnh sau.
Lưu ý rằng bạn sẽ cần chọn/nhập một dự án cụ thể khi được nhắc:

```bash
railway link
```

Bây giờ thư mục cục bộ và dự án đã _được liên kết_, bạn có thể chạy dự án Django cục bộ với cài đặt từ môi trường production.
Đầu tiên hãy đảm bảo rằng [môi trường phát triển Django](/en-US/docs/Learn_web_development/Extensions/Server-side/Django/development_environment) thông thường của bạn đã sẵn sàng.
Sau đó gọi lệnh sau, nhập tên, email và mật khẩu khi được yêu cầu:

```bash
railway run python manage.py createsuperuser
```

Bây giờ bạn có thể mở khu vực quản trị trang web của bạn (`https://[your-url].railway.app/admin/`) và điền dữ liệu vào cơ sở dữ liệu, giống như được hiển thị trong [Django Tutorial Part 4: Django admin site](/en-US/docs/Learn_web_development/Extensions/Server-side/Django/Admin_site)).

### Đặt biến cấu hình

Bước cuối cùng là làm cho trang web an toàn.
Cụ thể, chúng ta cần vô hiệu hóa ghi nhật ký debug và đặt khóa CSRF bí mật.
Công việc đọc các giá trị cần thiết từ biến môi trường đã được thực hiện trong [chuẩn bị trang web để xuất bản](#chuan-bi-trang-web-de-xuat-ban) (xem `DJANGO_DEBUG` và `DJANGO_SECRET_KEY`).

Mở màn hình thông tin cho dự án và chọn tab _Variables_.
Lúc này nó nên đã có `DATABASE_URL` như được hiển thị bên dưới.

![Railway - add a new variable screen](railway_variable_new.png)

Có nhiều cách để tạo khóa bí mật an toàn về mặt mật mã.
Một cách đơn giản là chạy lệnh Python sau trên máy tính phát triển của bạn:

```bash
python -c "import secrets; print(secrets.token_urlsafe())"
```

Chọn nút **New Variable** và nhập khóa `DJANGO_SECRET_KEY` với giá trị bí mật của bạn (sau đó chọn **Add**).
Sau đó nhập khóa `DJANGO_DEBUG` với giá trị `False`.
Bộ biến cuối cùng sẽ trông như sau:

![Railway screen showing all the project variables](railway_variables_all.png)

### Gỡ lỗi

Railway client cung cấp lệnh logs để hiển thị phần cuối của nhật ký (nhật ký đầy đủ hơn có sẵn trên trang cho mỗi dự án):

```bash
railway logs
```

Nếu bạn cần thêm thông tin hơn điều này có thể cung cấp, bạn sẽ cần bắt đầu xem xét [Django Logging](https://docs.djangoproject.com/en/5.0/topics/logging/).

## Tóm tắt

Đây là phần kết thúc của hướng dẫn về thiết lập ứng dụng Django trong production, và cũng là loạt hướng dẫn về làm việc với Django. Chúng ta hy vọng bạn đã thấy chúng hữu ích. Bạn có thể xem phiên bản hoàn chỉnh của [mã nguồn trên GitHub tại đây](https://github.com/mdn/django-locallibrary-tutorial).

Bước tiếp theo là đọc một vài bài viết cuối cùng của chúng ta, sau đó hoàn thành bài đánh giá.

## Xem thêm

- [Deploying Django](https://docs.djangoproject.com/en/5.0/howto/deployment/) (Tài liệu Django)
  - [Deployment checklist](https://docs.djangoproject.com/en/5.0/howto/deployment/checklist/) (Tài liệu Django)
  - [Deploying static files](https://docs.djangoproject.com/en/5.0/howto/static-files/deployment/) (Tài liệu Django)
  - [How to deploy with WSGI](https://docs.djangoproject.com/en/5.0/howto/deployment/wsgi/) (Tài liệu Django)
  - [How to use Django with Apache and mod_wsgi](https://docs.djangoproject.com/en/5.0/howto/deployment/wsgi/modwsgi/) (Tài liệu Django)
  - [How to use Django with Gunicorn](https://docs.djangoproject.com/en/5.0/howto/deployment/wsgi/gunicorn/) (Tài liệu Django)

- Railway Docs
  - [CLI](https://docs.railway.com/cli)

- DigitalOcean
  - [How To Serve Django Applications with uWSGI and Nginx on Ubuntu 16.04](https://www.digitalocean.com/community/tutorials/how-to-serve-django-applications-with-uwsgi-and-nginx-on-ubuntu-16-04)
  - [Other DigitalOcean Django community docs](https://www.digitalocean.com/community/tutorials?q=django)

- Heroku Docs (similar setup concepts)
  - [Configuring Django apps for Heroku](https://devcenter.heroku.com/articles/django-app-configuration) (Heroku docs)
  - [Getting Started on Heroku with Django](https://devcenter.heroku.com/articles/getting-started-with-python#introduction) (Heroku docs)
  - [Django and Static Assets](https://devcenter.heroku.com/articles/django-assets) (Heroku docs)
  - [Concurrency and Database Connections in Django](https://devcenter.heroku.com/articles/python-concurrency-and-database-connections) (Heroku docs)
  - [How Heroku works](https://devcenter.heroku.com/articles/how-heroku-works) (Heroku docs)
  - [Dynos and the Dyno Manager](https://devcenter.heroku.com/articles/dynos) (Heroku docs)
  - [Configuration and Config Vars](https://devcenter.heroku.com/articles/config-vars) (Heroku docs)
  - [Limits](https://devcenter.heroku.com/articles/limits) (Heroku docs)
  - [Deploying Python applications with Gunicorn](https://devcenter.heroku.com/articles/python-gunicorn) (Heroku docs)
  - [Working with Django](https://devcenter.heroku.com/categories/working-with-django) (Heroku docs)

{{PreviousMenuNext("Learn_web_development/Extensions/Server-side/Django/Testing", "Learn_web_development/Extensions/Server-side/Django/web_application_security", "Learn_web_development/Extensions/Server-side/Django")}}
