versions
version132: spec
	<version: '1.32' imports: #('1.3-baseline')>

	spec for: #'common' do: [
		spec timestamp: 'CamilloBruni 2014-01-28'.
		
		spec 
			project: 'Soup'          with: '1.2';
			project: 'CommandShell'  with: '1.1';
			project: 'XMLWriter'     with: #stable.
		
		spec 
			"ErwanDouaille CamilloBruni"
			package: 'CI-Core'               with: 'CI-Core-CamilloBruni.471';
			package: 'CI-FogBugzAPI'         with: 'CI-FogBugzAPI-CamilloBruni.50';
			package: 'CI-Integration'        with: 'CI-Integration-CamilloBruni.80';
			package: 'CI-Loader'             with: 'CI-Loader-CamilloBruni.6';
			package: 'CI-GoogleIssueTracker' with: 'CI-GoogleIssueTracker-CamilloBruni.2' ].
