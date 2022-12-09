package com.lec.ex03_speakertv;

public class Speaker implements IVolume{
	private int volumeLevel;
	private final int MAX_VOLUME = 50;
	private final int MIN_VOLUME = 0;
	public Speaker() {
		volumeLevel = 10;
	}
	@Override
	public void volumeUp() {//볼륨을 1씩증가
		if(volumeLevel < MAX_VOLUME) {
			volumeLevel ++;
			System.out.println("스피커 볼륨을 1만큼 올려 현재 볼륨은 " + volumeLevel);
		} else {
			System.out.println("스피커 볼륨이 최대치("+MAX_VOLUME+")여서 올리지 못합니다.");
		}
	}

	@Override
	public void volumeUp(int level) {
		if(volumeLevel + level <= MAX_VOLUME) {
			volumeLevel += level;
			System.out.println("스피커 볼륨을" + level + "만큼 올려 현재 볼륨은 " + volumeLevel);
		} else {
			int tempLevel = MAX_VOLUME - volumeLevel;
			volumeLevel = MAX_VOLUME;
			System.out.println("스피커 볼륨을" + tempLevel + "만큼 올려 최대치입니다.");
		}
	}

	@Override
	public void volumeDown() {
		if(volumeLevel > MIN_VOLUME) {
			volumeLevel --;
			System.out.println("스피커 볼륨을 1만큼 내려 현재 볼륨은 " + volumeLevel);
		}
			System.out.println("스피커 볼륨이 최소치("+MIN_VOLUME+")여서 내리지 못합니다.");
		
	}

	@Override
	public void volumeDown(int level) {
		if(volumeLevel - level > MIN_VOLUME) {
			volumeLevel -= level;
			System.out.println("스피커 볼륨을" + level + "만큼 내려 현재 볼륨은 " + volumeLevel);
		} else { // 현재 볼륨 5, level 7
			int tempLevel = (volumeLevel - MIN_VOLUME);
			volumeLevel = MIN_VOLUME;
			System.out.println("스피커 볼륨을" + tempLevel + "만큼 내려 최소치입니다.");
		}
		
	}
	
}
