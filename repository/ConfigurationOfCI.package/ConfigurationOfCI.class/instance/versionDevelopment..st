versions
versionDevelopment: spec
	<version: 'dev' imports: #('1.07-baseline')>

	spec for: #'common' do: [
		spec timestamp: 'CamilloBruni 4/10/2013 16:43'.
		
		spec 
			project: 'Soup'          with: '1.2';
			project: 'CommandShell'  with: '1.1';
			project: 'FuelMetalevel' with: #stable;
			project: 'XMLWriter'     with: #stable.
			
		spec 
			"ErwanDouaille"
			package: 'CI-Core'               with: 'CI-Core-CamilloBruni.185';
			package: 'CI-Integration'        with: 'CI-Integration-CamilloBruni.50';
			package: 'CI-Loader'             with: 'CI-Loader-CamilloBruni.6';
			package: 'CI-FogBugzAPI'         with: 'CI-FogBugzAPI-CamilloBruni.33';
			package: 'CI-GoogleIssueTracker' with: 'CI-GoogleIssueTracker-CamilloBruni.2' ].