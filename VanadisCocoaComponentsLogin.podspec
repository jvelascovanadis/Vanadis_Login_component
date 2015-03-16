Pod::Spec.new do |s|

s.platform     = :ios, "7.0"
s.name = 'VanadisCocoaComponentsLogin'

s.version = '0.0.11'

s.summary = 'Componente de Login y registro de Vanadis'

s.homepage = 'http://vanadis.es'

s.license = {

:type => 'MIT',
:file => 'LICENSE'

}

s.author = {
'Jorge' => 'jvelasco@vanadis.es'
}

s.source = {

:git => 'https://github.com/jvelascovanadis/Vanadis_Login_component.git',
:tag => s.version.to_s

}

s.source_files = 'VanadisCocoaComponentsLogin/*.{m,h}'
#s.resources = '*.{storyboard}'
#s.resource_bundle = { 'StandardUtils' => [ '*.{png,storyboard,lproj}' ]}
s.resource_bundle = { 'StandardUtils' => [ 'StandardUtilsBundle/**/*.{png,storyboard,lproj}' ] }
s.requires_arc = true

#s.dependency 'AFNetworking', '~> 1.0'

end
