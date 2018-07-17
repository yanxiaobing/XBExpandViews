Pod::Spec.new do |s|
    s.name         = 'XBExpandViews'
    s.version      = '0.0.2'
    s.summary      = 'expand feature and function'
    s.homepage     = 'https://github.com/yanxiaobing/XBExpandViews'
    s.license      = 'MIT'
    s.authors      = {'XBingo' => 'dove025@qq.com'}
    s.platform     = :ios, '8.0'
    s.source       = {:git => 'https://github.com/yanxiaobing/XBExpandViews.git', :tag => s.version}
    s.requires_arc = true

    s.subspec 'XBExpandButton' do |ss|
    ss.source_files = 'XBExpandViews/XBExpandButton/*.{h,m}'
  end

    s.subspec 'XBGradientColorView' do |ss|
    ss.source_files = 'XBExpandViews/XBGradientColorView/*.{h,m}'
  end

end