param (
	$TemplatePath
)

$templateARM = Get-Content $TemplatePath -Raw -ErrorAction SilentlyContinue
$template = ConvertFrom-Json -InputObject $templateARM -ErrorAction SilentlyContinue

Describe 'ARM Template Validation' {
	Context 'File Validation' {
		It 'Template ARM File Exists' {
			Test-Path $TemplatePath -Include '*.json' | Should Be $true
		}
    }
    Context 'Template Content Validation' {
        It "Creates the expected resources" {
            $type = 'Microsoft.Sql/servers'
            $templateResources = $template.Resources.type
            $templateResources | Should Be $type
        }
    }
}